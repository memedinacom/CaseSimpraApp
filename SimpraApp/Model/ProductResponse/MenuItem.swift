//
//	MenuItem.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class MenuItem : NSObject, NSCoding, Mappable{

	var group : Group?
	var id : String?
	var name : String?
	var price : Float?


	class func newInstance(map: Map) -> Mappable?{
		return MenuItem()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		group <- map["group"]
		id <- map["id"]
		name <- map["name"]
		price <- map["price"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         group = aDecoder.decodeObject(forKey: "group") as? Group
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Float

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if group != nil{
			aCoder.encode(group, forKey: "group")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}

	}

}
