//
//  DataManager.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
open class  DataManager {
    var sectionModel:SectionResponse?
    var actionModel:ActionResponseModel?
    var employeeModel:EmployeesResponseModel?
    var productModel:ProductResponseModel?
    var tablesModel:TablesResponseModel?
    var discounModel:DiscountResponseModel?
    var groups:GroupsResponseModel?
    
    struct Singleton {
           static let sharedInstance = DataManager()
       }
    class var sharedInstance: DataManager {
        return Singleton.sharedInstance
    }
    
    // MARK: - HotDrink
    //**TWVudUl0ZW1Hcm91cC01MWNkZGQ5Zi01OGQ5LTRmZWMtYTRiNy03YTRlYmVjZjc3MGY**/
         
}
