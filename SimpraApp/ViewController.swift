//
//  ViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 27.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SimpraApi.employess.fetchs(type: EmployeesResponseModel.self) { (response, error) in
            
            do {
              
                let realm = try Realm()
                           print(realm.configuration.fileURL?.absoluteString ?? "")
                           
                           try realm.write {
                            
                            for realmUserModel  in response!.employees!{
                                let storedEmploye = Specimen()
//                                storedEmploye.identifier = Int(realmUserModel.id!)!
//                                storedEmploye.realName = realmUserModel.lastName!
//                                storedEmploye.pin = realmUserModel.pin!
//                                storedEmploye.name = realmUserModel.firstName!
                                storedEmploye.latitude = 3244
                                realm.add(storedEmploye ,update: .all)
                            }
                            
                               

                    }
                
                
            } catch {
            }
            
        }
    
       
        
    }


}

