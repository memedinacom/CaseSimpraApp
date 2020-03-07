//
//  SimpraBarButtonItem.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 7.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

class BarButton: UIButton {
    
    var imagePath:String?{
        didSet{
            self.setImage(#imageLiteral(resourceName: imagePath!).withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    var titleString:String?{
        didSet{
            self.setTitle(titleString, for: .normal)
        }
    }
    
    public var actionHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 44, height: 34))
        
        prepareForInterfaceBuilder()
        self.prepareButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareForInterfaceBuilder()
        self.prepareButton()
    }
    
    func prepareButton(){
        self.tintColor = UIColor.coolGrey
        self.addTarget(self, action: #selector(barButtonItemPressed(sender:)), for: .touchUpInside)
        self.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        self.titleLabel?.font = UIFont.helveticaNeueBold
        self.titleLabel?.textColor = UIColor.coolGrey
        self.titleLabel?.tintColor = UIColor.coolGrey
    }
    
    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
    
}

class SimpraBarButtonItem: UIBarButtonItem {
    let button  = BarButton()
    override init() {
        super.init()
        self.customView = button
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickedAction(sender: UIBarButtonItem) {
    }
}
