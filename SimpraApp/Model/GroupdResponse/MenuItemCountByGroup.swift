//
//	MenuItemCountByGroup.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class MenuItemCountByGroup : NSObject, NSCoding, Mappable{

	var count : Int?
	var targetId : String?


	class func newInstance(map: Map) -> Mappable?{
		return MenuItemCountByGroup()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		count <- map["count"]
		targetId <- map["target_id"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         targetId = aDecoder.decodeObject(forKey: "target_id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if targetId != nil{
			aCoder.encode(targetId, forKey: "target_id")
		}

	}

}
