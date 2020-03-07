//
//  RestoranViewController+Navbar.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 6.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

extension RestoranViewController:ChangeTableItemProtocol{
    func selectTableItem(item: Table) {
        self.navigationController?.popViewController(animated: false)
    }
    
    //Func setup all navigaiton item
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavITem()
        setupRemainingNavItems()
    }
    
    //NAvigaiton bar item
    private func setupLeftNavItem() {
     
        let addButton = SimpraBarButtonItem()
        addButton.button.imagePath = "plus"
        addButton.button.actionHandler = {[weak self] in
            self?.openSearchController()
        }
        
        let addTable = SimpraBarButtonItem()
        addTable.button.imagePath = "round-table"
        addTable.button.actionHandler = {[weak self] in
            self?.openSearchController()
        }
        
        navigationItem.leftBarButtonItems = [ addButton , addTable]
    }
    
    func setupRightNavITem(){
        let composeButton = SimpraBarButtonItem()
        composeButton.button.titleString = " AU"
        composeButton.button.actionHandler = {[weak self] in
            self?.goToSetting()
        }
        navigationItem.rightBarButtonItems = [composeButton]
    }
    
    //Ayarlar Sayfası
      @objc func goToSetting(){
          performSegue(withIdentifier: ViewControllerSegue.RestorantToSetting.rawValue, sender: nil)
      }
    
    @objc private func openSearchController(){
        let _searchTableViewController = SearchTableViewController.instantiate(fromAppStoryboard: .Main)
        _searchTableViewController.delegate = self
        self.navigationController?.pushViewController(_searchTableViewController, animated: true)
    }
}
