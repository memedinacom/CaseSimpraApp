//
//	ViewOption.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class ViewOption : NSObject, NSCoding, Mappable{

	var name : String?
	var value : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return ViewOption()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		name <- map["name"]
		value <- map["value"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         name = aDecoder.decodeObject(forKey: "name") as? String
         value = aDecoder.decodeObject(forKey: "value") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if value != nil{
			aCoder.encode(value, forKey: "value")
		}

	}

}
