//
//	ProductResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class ProductResponseModel : NSObject, NSCoding, Mappable{

	var menuItems : [MenuItem]?


	class func newInstance(map: Map) -> Mappable?{
		return ProductResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		menuItems <- map["menu_items"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         menuItems = aDecoder.decodeObject(forKey: "menu_items") as? [MenuItem]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if menuItems != nil{
			aCoder.encode(menuItems, forKey: "menu_items")
		}

	}

}
