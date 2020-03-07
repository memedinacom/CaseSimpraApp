//
//  BaseViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {
    var navigationControllers:UINavigationController = UINavigationController()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareNavigationBar()  
    }
    
    func prepareNavigationBar(){
        self.navigationController?.navigationBar.backgroundColor = .darkGray
    }
    
    // Goto Login ViewController
    func gotoLogin(){
        
        let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
        rootViewController.view.removeFromSuperview()
        rootViewController.dismiss(animated: false, completion: {
            
            let view = LoginViewController.instantiate(fromAppStoryboard: .Login)
            //view.hideBackButton = true
            self.showRootViewController(view, inWindow: self.appDelegate.window!, isNavBar: true)
        })
        
    }
    
    //Goto HomeViewController
    func goHome(){
        let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
        rootViewController.view.removeFromSuperview()
        rootViewController.dismiss(animated: false, completion: {
            
            let view = FastFoodViewController.instantiate(fromAppStoryboard: .Main)
            //view.hideBackButton = true
            self.showRootViewController(view, inWindow: self.appDelegate.window!, isNavBar: true)
        })
    }
    
    func goRestoranViewController(){
        let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
        rootViewController.view.removeFromSuperview()
        rootViewController.dismiss(animated: false, completion: {
            
            let view = RestoranViewController.instantiate(fromAppStoryboard: .Main)
            //view.hideBackButton = true
            self.showRootViewController(view, inWindow: self.appDelegate.window!, isNavBar: true)
        })
    }
    
    func goFastFoodViewController(selectTable data:Table? = nil){
        let rootViewController = UIApplication.shared.keyWindow!.rootViewController!
        rootViewController.view.removeFromSuperview()
        rootViewController.dismiss(animated: false, completion: {
    
            let view = FastFoodViewController.instantiate(fromAppStoryboard: .Main)
            view.selectData = data
            self.showRootViewController(view, inWindow: self.appDelegate.window!, isNavBar: true)
        })
    }
    
    //Setup navigaiton bar
       func setupRemainingNavItems() {
          navigationController?.navigationBar.backgroundColor = .darkGray
          navigationController?.navigationBar.isTranslucent = false
          navigationController?.navigationBar.barTintColor = UIColor.navGrey
      }
    
    //RootViewController
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow, isNavBar:Bool ) {
        navigationControllers.viewControllers = [viewController]
        inWindow.rootViewController = navigationControllers
        inWindow.makeKeyAndVisible()
    }
    
}
