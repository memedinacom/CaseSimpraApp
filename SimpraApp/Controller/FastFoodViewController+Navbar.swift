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
    
    //Func setup all navigaiton item
    func setupNavigationBarItems() {
        if selectData != nil{
            self.closeButton(title: selectData?.name ?? "Masa")
            self.setupRightNavItems()
        }else{
            setupLeftNavItem()
            setupRightNavItems()
        }
        
        setupRemainingNavItems()
    }
    
    
    //NAvigaiton bar item
    private func setupLeftNavItem() {
        
        let plusButton = SimpraBarButtonItem()
        plusButton.button.imagePath = "plus"
        plusButton.button.actionHandler = {[weak self] in
            self?.showPopoverButtonAction(plusButton)
        }
        
        
        let addTicket = SimpraBarButtonItem()
        addTicket.button.imagePath = "add"
        addTicket.button.actionHandler = {[weak self] in
            self?.showPopoverButtonAction(addTicket)
        }
        
        navigationItem.leftBarButtonItems = [plusButton , addTicket]
    }
    
    //Navigaiton Bar İtem
    private func setupRightNavItems() {
        
        let composeButton = SimpraBarButtonItem()
        composeButton.button.titleString = " AU"
        composeButton.button.actionHandler = {[weak self] in
            self?.goToSetting()
        }
        navigationItem.rightBarButtonItems = [composeButton]
    }
    
    func closeButton(title:String){
        
        let closeButton = SimpraBarButtonItem()
        closeButton.button.imagePath = "close"
        closeButton.button.actionHandler = {[weak self] in
            self?.dismisViewController()
        }
        
        let titleButton = SimpraBarButtonItem()
        titleButton.button.titleString = title
        titleButton.button.titleLabel?.font = .helveticaNeueBold15
        titleButton.button.actionHandler = {[weak self] in
            self?.dismisViewController()
        }

        navigationItem.leftBarButtonItems = [ closeButton,titleButton]
    }
    
    @objc func dismisViewController(){
        self.navigationController?.popViewController(animated: false)
    }
    
    //Ayarlar Sayfası
    @objc func goToSetting(){
        performSegue(withIdentifier: ViewControllerSegue.FastFoodToSetting.rawValue, sender: nil)
    }
    
    //ViewController Popup açılması
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

// MARK: Extensions
extension FastFoodViewController:UIPopoverPresentationControllerDelegate{
    
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
