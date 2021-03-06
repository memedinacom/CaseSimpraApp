//
//  UIView+Additions.swift
//  Passo
//
//  Created by Mehmet Zeytin on 27/07/2017.
//  Copyright (c) 2003-2017 Nuevo Group Limited. All rights reserved.
//

import UIKit

extension UIView {
    func ownFirstNib() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
        
    }
    
    func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    // MARK: - singleton show spinner
    func showLoading(message: String? = nil) {
        NewLoadingView.shared.show(on: self, message: message)
    }
    // MARK: - singleton hide spinner
    func hideLoading() {
        NewLoadingView.shared.hide()
    }
    
    // MARK: - Show Activity indicator
    final func setActivityIndicator(visible: Bool) {
        
        DispatchQueue.main.async {
            
            if visible && self.viewWithTag(92) == nil {
                
                let view = UIView(frame: self.bounds)
                view.tag = 92
                
                let activity = UIActivityIndicatorView(frame: CGRect(origin: view.center, size: CGSize(width: 40, height: 40)))
                
                activity.style = .white
                activity.color = UIColor.lightGray
                activity.hidesWhenStopped = true
                
                view.addSubview(activity)
                self.addSubview(view)
                activity.startAnimating()
                
            } else if let activityIndicator = self.viewWithTag(92), !visible {
                
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    //Remove all subviews
    func removeAllSubviews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
