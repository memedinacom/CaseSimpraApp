//
//	Group.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Group : NSObject, NSCoding, Mappable{

	var id : String?
	var menuItemCountByGroup : [MenuItemCountByGroup]?
	var name : String?
	var groups : [Group]?


	class func newInstance(map: Map) -> Mappable?{
		return Group()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["id"]
		menuItemCountByGroup <- map["menu_item_count_by_group"]
		name <- map["name"]
		groups <- map["groups"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? String
         menuItemCountByGroup = aDecoder.decodeObject(forKey: "menu_item_count_by_group") as? [MenuItemCountByGroup]
         name = aDecoder.decodeObject(forKey: "name") as? String
         groups = aDecoder.decodeObject(forKey: "groups") as? [Group]

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
		if menuItemCountByGroup != nil{
			aCoder.encode(menuItemCountByGroup, forKey: "menu_item_count_by_group")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if groups != nil{
			aCoder.encode(groups, forKey: "groups")
		}

	}

}