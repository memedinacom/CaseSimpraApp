//
//	DiscountResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class DiscountResponseModel : NSObject, NSCoding, Mappable{

	var discounts : [Discount]?


	class func newInstance(map: Map) -> Mappable?{
		return DiscountResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		discounts <- map["discounts"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         discounts = aDecoder.decodeObject(forKey: "discounts") as? [Discount]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if discounts != nil{
			aCoder.encode(discounts, forKey: "discounts")
		}

	}

}
