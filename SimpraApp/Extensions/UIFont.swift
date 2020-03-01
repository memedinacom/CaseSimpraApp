//
//  UIFont.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    
    class var helveticaNeueBold: UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 16.67)!
    }
    class var helveticaNeueBold15: UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 15)!
    }
    
    class var helveticaNeueBold12: UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 12.00)!
    }
    class var helveticaNeue: UIFont {
        return UIFont(name: "HelveticaNeue", size: 15)!
    }
    class var helveticaMedium12: UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: 12)!
    }
    class var helveticaMedium8: UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: 10)!
    }
    class var helveticaMedium8Italic: UIFont {
        return UIFont(name: "HelveticaNeue-Italic", size: 14)!
    }
    class var helveticaMedium16: UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: 16)!
    }
    class var helveticaMedium23: UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: 23)!
    }
    class func ekTextStyle23Font() -> UIFont? {
        return UIFont(name: "MinionPro-Bold", size: 23.0)
    }
}
