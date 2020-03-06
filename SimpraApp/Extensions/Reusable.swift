
import Foundation

protocol Reusable {
    static var defaultReuseID: String { get }
}

extension Reusable {
    static var defaultReuseID: String {
        return String(describing: self)
    }
}


protocol NibReusable: Reusable, NibLoadable { }
