//
//	TenderMedia.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class TenderMedia : NSObject, NSCoding, Mappable{

	var id : String?
	var name : String?
	var type : String?
	var viewOptions : [ViewOption]?


	class func newInstance(map: Map) -> Mappable?{
		return TenderMedia()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		name <- map["name"]
		type <- map["type"]
		viewOptions <- map["view_options"]
		
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
         viewOptions = aDecoder.decodeObject(forKey: "view_options") as? [ViewOption]

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
		if viewOptions != nil{
			aCoder.encode(viewOptions, forKey: "view_options")
		}

	}

}
