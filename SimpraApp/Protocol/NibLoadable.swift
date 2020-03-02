

import UIKit

protocol NibLoadable {
    static var defaultNibName: String { get }
    static var defaultBundle: Bundle { get }
    static var defaultNib: UINib { get }
    static func loadFromNib() -> Self
}

extension NibLoadable {
    
    static var defaultNibName: String {
        return String(describing: self)
    }
    
    static var defaultBundle: Bundle {
        return Bundle.main
    }
    
    static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: defaultBundle)
    }
    
    static func loadFromNib() -> Self {
        return defaultBundle.loadNibNamed(defaultNibName, owner: nil, options: nil)![0] as! Self
    }
}
