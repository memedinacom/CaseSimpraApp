//
//  LoginViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtPassword: RoundedTextField!
    @IBOutlet weak var txtUsername: RoundedTextField!
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareUI()
        
    }
    
    // MARK: - Functions
    
    // MARK: - Prepare UI
    func prepareUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Actions
    
    // MARK: - Login
    @IBAction func touchLogin(_ sender: Any) {
        
        do {
            guard let db = try? SimpraDB() else {return}
            db.loginWithUser(firstName: "Hasan", lastname: "Soysal", password: txtPassword.text!, closure: { (auth) in
                if auth{
                    print("User Authhanticated")
                    self.goHome()
                }else{
                    SimpraNotify.presentTopFloat(description: "Kullanıcı adı veya pin yanlış - pin 998899", image: nil, color: UIColor.redToast)
                }
            })
        }
        
        
    }
    // MARK: - Protocol
    
}

