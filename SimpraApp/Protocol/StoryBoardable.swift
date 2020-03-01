//
//  StoryBoardable.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit
protocol StoryboardLoadable {
    static var defaultStoryboardName: String { get }
    static var defaultViewControllerID: String { get }
    static var defaultBundle: Bundle { get }
    static func loadFromStoryboard() -> Self
}

extension StoryboardLoadable where Self: UIViewController {
    
    static var defaultViewControllerID: String {
        return String(describing: self)
    }
    
    static var defaultBundle: Bundle {
        return Bundle.main
    }
    
    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: defaultStoryboardName, bundle: defaultBundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: defaultViewControllerID) as? Self else {
            fatalError("[StoryboardLoadable] Cannot instantiate view controller from storyboard.")
        }
        return viewController
    }
}
