//
//	Table.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class Table : NSObject, NSCoding, Mappable{

	var id : String?
	var name : String?
	var revenueCenter : RevenueCenter?


	class func newInstance(map: Map) -> Mappable?{
		return Table()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		name <- map["name"]
		revenueCenter <- map["revenue_center"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         revenueCenter = aDecoder.decodeObject(forKey: "revenue_center") as? RevenueCenter

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
		if revenueCenter != nil{
			aCoder.encode(revenueCenter, forKey: "revenue_center")
		}

	}

}
