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
            

            
        }
    
       
        
    }


}

