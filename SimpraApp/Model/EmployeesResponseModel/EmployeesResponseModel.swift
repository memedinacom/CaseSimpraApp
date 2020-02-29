//
//	TablesResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class EmployeesResponseModel : NSObject, NSCoding, Mappable{

	var employees : [Employee]?


	class func newInstance(map: Map) -> Mappable?{
		return EmployeesResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		employees <- map["employees"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         employees = aDecoder.decodeObject(forKey: "employees") as? [Employee]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if employees != nil{
			aCoder.encode(employees, forKey: "employees")
		}

	}

}
