//
//  LoginViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
class LoginViewController: BaseViewController {
// MARK: - Outlets
    @IBOutlet weak var txtPassword: RoundedTextField!
    @IBOutlet weak var txtUsername: RoundedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
       // MARK: - Lifecyle
       // MARK: - Properties
       // MARK: - Functions
       // MARK: - Actions
    
    @IBAction func touchLogin(_ sender: Any) {
        self.goHome()
    }
    // MARK: - Protocol
    


}

