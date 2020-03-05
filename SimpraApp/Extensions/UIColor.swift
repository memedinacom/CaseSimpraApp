//
//  UIColor.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import Foundation
import UIKit

extension UIColor{
    
    public static let orange1 = UIColor(red: 244.0/255.0,
                                        green: 121.0/255.0,
                                        blue: 32.0/255.0,
                                        alpha: 1.0)
    
    public static let tealishGreen = UIColor(red: 17.0 / 255.0,
                                             green: 214.0 / 255.0,
                                             blue: 116.0 / 255.0,
                                             alpha: 1.0)
    
    public static let coolGrey = UIColor(red: 148.0 / 255.0,
                                         green: 151.0 / 255.0,
                                         blue: 153.0 / 255.0,
                                         alpha: 1.0)
    
    public static let orange = UIColor(red: 244.0 / 255.0,
                                       green: 121.0 / 255.0,
                                       blue: 32.0 / 255.0,
                                       alpha: 1.0)
    
    public static let slateGrey = UIColor(red: 99.0 / 255.0,
                                          green: 100.0 / 255.0,
                                          blue: 102.0 / 255.0,
                                          alpha: 1.0)
    
    public static let lightGray = UIColor(red: 247.0 / 255.0,
                                          green: 247.0 / 255.0,
                                          blue: 247.0 / 255.0,
                                          alpha: 1.0)
    
    public static let navGrey = UIColor(red: 67.0 / 255.0,
                                        green: 70.0 / 255.0,
                                        blue: 74.0 / 255.0,
                                        alpha: 0.5)
    
    public static let viewCellBorderGrey = UIColor(red:0.75,
                                                   green:0.75,
                                                   blue:0.75,
                                                   alpha:1.0)
    
    public static let segmentBackgroundGrey = UIColor(red: 244.0 / 255.0,
                                                      green: 244.0 / 255.0,
                                                      blue: 244.0 / 255.0,
                                                      alpha: 1.0)
    
    public static let scarlet = UIColor(red: 208.0 / 255.0,
                                        green: 2.0 / 255.0,
                                        blue: 27.0 / 255.0,
                                        alpha: 1.0)
    
    public static let greenToast = UIColor(red:0.27,
                                           green:0.45,
                                           blue:0.16,
                                           alpha:1.0)
    
    public static let redToast = UIColor(red:208/255.0,
                                         green:2/255.0,
                                         blue:27/255.0,
                                         alpha:1.0)
    
    public static let orange3 = UIColor(red:0.40,
                                        green:0.40,
                                        blue:0.40,
                                        alpha:1.0)
    
    static let primaryColor = UIColor(red: 69/255,
                                      green: 193/255,
                                      blue: 89/255, alpha: 1)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
     
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
