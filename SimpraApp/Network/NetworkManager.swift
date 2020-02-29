//
//  NetworkManager.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 27.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper
import RealmSwift
import Realm
import AlamofireObjectMapper



/*!
 * @discussion Network Manager
 * @params Sections , groups , discount , actions , tables ,employess
 * @return <#returntype#>
 */


enum SimpraApi {
    
    case sections
    case groups
    case products
    case discount
    case actions
    case tables
    case employess
    
    
    //Coolest Swift Method
    static let  API_URL = "https://api.myjson.com/bins/"
    var path : String {
        get {
            switch(self) {
            case .sections:
                return "ai0m4"
                
            case .groups:
                return "odf0c"
                
            case .products:
                return "dd418"
                
            case .discount:
                return "i6q18"
                
            case .actions:
                return "tk3os"
                
            case .tables:
                return "19vt3g"
                
            case .employess:
                return "18e830"
            }
        }
    }
    
    var urlStr:String{
        get{
            return SimpraApi.API_URL + path
        }
    }
    
    
    var Url : URL {
        get {
            
            return URL(string: self.path)!
            
        }
    }

    
    func getDataWithRealm <T: Object> (type: T.Type, success:@escaping () -> Void,
                                    fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable {
        Alamofire.request(URL(string: urlStr)!).responseArray { (response: DataResponse<[T]>) in
           switch response.result {
           case .success(let items):
               do {
                   let realm = try Realm()
                   try realm.write {
                       for item in items {
                           realm.add(item)
                       }
                   }
               } catch let error as NSError {
                   fail(error)
               }
               success()
           case .failure(let error):
               fail(error as NSError)
           }
       }
   }
    
    /*!
     * @discussion Generic oluşturulmuş request methodu
     * @params <T> generic
     * @return response, error
     */
    
    func fetchs<T: Mappable>(type: T.Type,
                             completion: @escaping (T?, Error?) -> Void) {
        Alamofire.request(self.urlStr).responseJSON { response in
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                let d = Mapper<T>().map(JSONObject:JSON)
                print(d)
                
                completion(d,response.error)
            }
            
        }
        
    }
    
}



