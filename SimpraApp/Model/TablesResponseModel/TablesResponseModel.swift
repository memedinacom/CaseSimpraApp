//
//	TablesResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class TablesResponseModel : NSObject, NSCoding, Mappable{

	var tables : [Table]?


	class func newInstance(map: Map) -> Mappable?{
		return TablesResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		tables <- map["tables"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         tables = aDecoder.decodeObject(forKey: "tables") as? [Table]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if tables != nil{
			aCoder.encode(tables, forKey: "tables")
		}

	}

}
