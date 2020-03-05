//
//  StepperButton.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 3.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

class StepperButton: UIButton {

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
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = .white
    }
    

}
