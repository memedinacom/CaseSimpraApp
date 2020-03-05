//
//  ViewController+Navbar.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit
extension FastFoodViewController {
    
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        navigationController?.navigationBar.backgroundColor = .darkGray
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.navGrey
    }
    
    private func setupLeftNavItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "plus").withRenderingMode(.alwaysTemplate), for: .normal)
        followButton.tintColor = UIColor.coolGrey
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        followButton.addTarget(self, action: #selector(showPopoverButtonAction), for: .touchUpInside)

        let addTicket = UIButton(type: .system)
        addTicket.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate), for: .normal)
        addTicket.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        addTicket.tintColor = UIColor.coolGrey
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: followButton),
                                             UIBarButtonItem(customView: addTicket)]
    }
    
    private func setupRightNavItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "more").withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.tintColor = UIColor.coolGrey
        
        let composeButton = UIButton(type: .system)
        //composeButton.setImage(#imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate), for: .normal)
        composeButton.setTitle("AU", for: .normal)
        composeButton.titleLabel?.font = UIFont.helveticaNeueBold
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        composeButton.tintColor = UIColor.coolGrey
        composeButton.addTarget(self, action: #selector(goToSetting), for: .touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    @objc func goToSetting(){
        performSegue(withIdentifier: ViewControllerSegue.FastFoodToSetting.rawValue, sender: nil)
    }
    
    @IBAction func showPopoverButtonAction(_ sender: Any) {
        //get the button frame
        /* 1 */
        let button = sender as? UIButton
        let buttonFrame = button?.frame ?? CGRect.zero
        
        /* 2 */
        //Configure the presentation controller
        let popoverContentController = CoverOperationsViewController.instantiate(fromAppStoryboard: .Main)
        popoverContentController.modalPresentationStyle = .popover
        
        /* 3 */
        if let popoverPresentationController = popoverContentController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = buttonFrame
            popoverPresentationController.delegate = self
                present(popoverContentController, animated: true, completion: nil)
            
        }
    }
}

extension FastFoodViewController:UIPopoverPresentationControllerDelegate{
    //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    //UIPopoverPresentationControllerDelegate
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
