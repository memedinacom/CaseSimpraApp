//
//	Discount.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class Discount : NSObject, NSCoding, Mappable{

	var id : String?
	var name : String?
	var type : String?
	var value : Int?


	class func newInstance(map: Map) -> Mappable?{
		return Discount()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		name <- map["name"]
		type <- map["type"]
		value <- map["value"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         value = aDecoder.decodeObject(forKey: "value") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if value != nil{
			aCoder.encode(value, forKey: "value")
		}

	}

}
