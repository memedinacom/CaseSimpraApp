//
//	MenuItemGroup.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class MenuItemGroup : NSObject, NSCoding, Mappable{

	var groups : [Group]?
	var id : String?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return MenuItemGroup()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		groups <- map["groups"]
		id <- map["id"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         groups = aDecoder.decodeObject(forKey: "groups") as? [Group]
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if groups != nil{
			aCoder.encode(groups, forKey: "groups")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}