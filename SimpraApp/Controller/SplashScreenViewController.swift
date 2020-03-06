

//
//  SplashScreenViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//


import UIKit


class SplashScreenViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let db = try? SimpraDB() else { return }
        db.isValidDataEmployee() ? redirectLogin() : saveData()
    }
    
    // MARK: - Saved employee data
    func saveData(){
        SimpraApi.employess.fetchs(decodable: EmployeeModel.self) { (data) in
            guard let db = try? SimpraDB() else { return }
            db.saveUserData(data)
            self.redirectLogin()
        }
    }
    
    // MARK: - Fetch Data
    func fetchData(){
        SimpraApi.employess.fetchs(decodable: EmployeeModel.self) { (data) in
            guard let db = try? SimpraDB() else { return }
            db.saveUserData(data)
        }
    }
    
    // MARK: - Redirect Login
    func redirectLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            self.gotoLogin()
        }
    }
    
}
