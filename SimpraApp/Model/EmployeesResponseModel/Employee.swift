//
//	Employee.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Employee : NSObject, NSCoding, Mappable{

	var firstName : String?
	var id : String?
	var lastName : String?
	var pin : String?


	class func newInstance(map: Map) -> Mappable?{
		return Employee()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		firstName <- map["first_name"]
		id <- map["id"]
		lastName <- map["last_name"]
		pin <- map["pin"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         firstName = aDecoder.decodeObject(forKey: "first_name") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         lastName = aDecoder.decodeObject(forKey: "last_name") as? String
         pin = aDecoder.decodeObject(forKey: "pin") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if firstName != nil{
			aCoder.encode(firstName, forKey: "first_name")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "last_name")
		}
		if pin != nil{
			aCoder.encode(pin, forKey: "pin")
		}

	}

}
