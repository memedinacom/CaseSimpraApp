//
//  StoreGroupModel.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import RealmSwift


class StoredGroup: Object{
    
    @objc dynamic var id : String = ""
    var menuItemCountByGroup : [StoreMenuItemCountByGroup] = []
    var name : String = ""
    var groups : [StoredGroup] = []
    
    override static func primaryKey() -> String? {
           return "id"
       }
}

class StoredGroupsResponseModel:  Object{
    var menuItemGroups : [StoredMenuItemGroup] = []
}
class StoreMenuItemCountByGroup: Object {
    var count : Int = 0
    var target_id : String = ""
 
}
class StoredMenuItemGroup: Object {
    var groups : [StoredGroup] = []
    @objc dynamic var id : String = ""
    var name : String = ""
    
    override static func primaryKey() -> String {
              return "id"
          }
    
}
