//
//	GroupsResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class GroupsResponseModel : NSObject, NSCoding, Mappable{

	var menuItemGroups : [MenuItemGroup]?


	class func newInstance(map: Map) -> Mappable?{
		return GroupsResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		menuItemGroups <- map["menu_item_groups"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         menuItemGroups = aDecoder.decodeObject(forKey: "menu_item_groups") as? [MenuItemGroup]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if menuItemGroups != nil{
			aCoder.encode(menuItemGroups, forKey: "menu_item_groups")
		}

	}

}
