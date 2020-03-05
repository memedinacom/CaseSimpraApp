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

// MARK: - ENUM Simpra API
enum SimpraApi {
    
    case sections
    case groups
    case products
    case discount
    case actions
    case tables
    case employess
    
    // MARK: - Path for Request -> using for URL created
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
    // MARK: - URL String for Request URL
    var urlStr:String{
        get{
            return SimpraApi.API_URL + path
        }
    }
    
    // MARK: - URL for Request
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
     * @discussion Generic oluşturulmuş request methodu Mapable ile çalışıyor
     * @params <T> generic
     * @return response, error
     */
    
    func fetchs<T: Mappable>(type: T.Type,
                             completion: @escaping (T?, Error?) -> Void) {
        Alamofire.request(self.urlStr).responseJSON { response in
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                let d = Mapper<T>().map(JSONObject:JSON)
                switch(self) {
                case .sections:
                    DataManager.sharedInstance.sectionModel = d as? SectionResponse
                    
                case .groups:
                    DataManager.sharedInstance.groups = d as? GroupsResponseModel
                    
                case .products:
                    DataManager.sharedInstance.productModel = d as? ProductResponseModel
                    
                case .discount:
                    DataManager.sharedInstance.discounModel = d as? DiscountResponseModel
                    
                case .actions:
                    DataManager.sharedInstance.actionModel = d as? ActionResponseModel
                    
                case .tables:
                    DataManager.sharedInstance.tablesModel = d as? TablesResponseModel
                    
                case .employess:
                    DataManager.sharedInstance.employeeModel = d as? EmployeesResponseModel
                }
                
                completion(d,response.error)
            }
            
        }
        
    }
    
    /*!
     * @discussion Generic oluşturulmuş request methodu Codable ile çalışıyor
     * @params <T> generic
     * @return response, error
     */
    func fetchs<T: Decodable>(decodable: T.Type, completion:@escaping (_ details: T) -> Void)
    {
        Alamofire.request(URL(string: self.urlStr)!).responseJSON { response in
            let result_ = response.data
            do {
                let data = try JSONDecoder().decode(T.self, from: result_!)
                completion(data)
            } catch let e as NSError {
                print("error : \(e)")
            }
        }
    }
    
}

