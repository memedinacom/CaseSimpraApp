//
//  ViewController+Navbar.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit
extension RestoranViewController {
    
    func setupNavigationBarItems() {
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        //Logo
//        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
//        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
//        titleImageView.contentMode = .scaleAspectFit
//
//        navigationItem.titleView = titleImageView
        
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
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
