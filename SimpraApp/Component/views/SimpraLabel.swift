//
//  SimpraLabel.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class SimpraLabel: UILabel {
    @IBInspectable  weak var bColor: UIColor! {//Background Color
        didSet {
            self.backgroundColor = bColor
        }
    }
    @IBInspectable  weak var tColor: UIColor! {//titnt Color
        didSet {
            self.textColor = tColor
        }
    }
    override func prepareForInterfaceBuilder() {
        self.textColor = tColor
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        self.font = UIFont.helveticaNeue
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
          prepareForInterfaceBuilder()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareForInterfaceBuilder()
        
    }
    
}
