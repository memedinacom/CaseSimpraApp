//
//  EmployeeModel.swift
//  RealmSwiftCodable
//
//  Created by Mehmet Zeytin on 2.03.2020.
//  Copyright © 2020 Adib Contractor. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

import Foundation
@objcMembers class EmployeeModel: Object, Decodable {
    
    dynamic var  employees = RealmSwift.List<employee_item>()
    dynamic var id:String?
    
    enum CodingKeys: String, CodingKey {
        case employees
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let list = try container.decode([employee_item].self, forKey: .employees)
        employees.append(objectsIn: list)
        id = UUID().uuidString
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
    
    
}



// MARK: - menu_item_groups Dict

@objcMembers class employee_item: Object, Decodable {
    dynamic var id: String?
    dynamic var last_name: String?
    dynamic var first_name :String?
    dynamic var pin:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case last_name
        case first_name
        case pin
        
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //id = try? container.decode(String.self, forKey: .id)
        id = UUID().uuidString
        last_name = try container.decode(String.self, forKey: .last_name)
        first_name = try container.decode(String.self, forKey: .first_name)
        pin = try container.decode(String.self, forKey: .pin)
        
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
    
    
}


class ProductItem: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var price = 0
}
