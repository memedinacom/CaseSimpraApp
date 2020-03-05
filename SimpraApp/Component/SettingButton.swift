//
//  SettingButton.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 3.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

class SettingButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareForInterfaceBuilder()
        self.prepareButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareForInterfaceBuilder()
        self.prepareButton()
        
    }
    
    func prepareButton(){
        let spacing:CGFloat = 15.0
        self.imageEdgeInsets = UIEdgeInsets(top: spacing, left: 0, bottom: spacing, right: spacing)
        self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        self.imageView?.contentMode = .scaleAspectFit
        //self.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = .white
    }
    

}
