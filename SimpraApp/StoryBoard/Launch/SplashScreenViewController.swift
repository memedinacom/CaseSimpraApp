

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
        self.redirectLogin()
    }
    
    func redirectLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            self.gotoLogin()
        }
    }

}
