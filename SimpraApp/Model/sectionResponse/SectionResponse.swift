//
//	SectionResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class SectionResponse : NSObject, NSCoding, Mappable{

	var sections : [Section]?


	class func newInstance(map: Map) -> Mappable?{
		return SectionResponse()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		sections <- map["sections"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         sections = aDecoder.decodeObject(forKey: "sections") as? [Section]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if sections != nil{
			aCoder.encode(sections, forKey: "sections")
		}

	}

}