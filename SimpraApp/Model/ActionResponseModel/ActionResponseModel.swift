//
//	ActionResponseModel.swift
//  Created by Mehmet Zeytin on 29.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation 
import ObjectMapper


class ActionResponseModel : NSObject, NSCoding, Mappable{

	var tenderMedias : [TenderMedia]?


	class func newInstance(map: Map) -> Mappable?{
		return ActionResponseModel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		tenderMedias <- map["tender_medias"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         tenderMedias = aDecoder.decodeObject(forKey: "tender_medias") as? [TenderMedia]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if tenderMedias != nil{
			aCoder.encode(tenderMedias, forKey: "tender_medias")
		}

	}

}
