//
//  UIView+Additions.swift
//  Passo
//
//  Created by Serdar Buhan on 27/07/2017.
//  Copyright (c) 2003-2017 Monitise Group Limited. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Monitise Group Limited.
//  Any reproduction of this material must contain this notice.
//

import UIKit

extension UIView {
  
  func ownFirstNib() {
    let view = viewFromNibForClass()
    view.frame = bounds
    view.autoresizingMask = [
      UIViewAutoresizing.flexibleWidth,
      UIViewAutoresizing.flexibleHeight
    ]
    addSubview(view)

  }
  
  func viewFromNibForClass() -> UIView {
    let bundle = Bundle(for: type(of: self))
    
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    return view
  }
  
  func showLoading(message: String? = nil) {
    NewLoadingView.shared.show(on: self, message: message)
  }
  
  func hideLoading() {
    NewLoadingView.shared.hide()
  }
  
  final func setActivityIndicator(visible: Bool) {
    
    DispatchQueue.main.async {
      
      if visible && self.viewWithTag(92) == nil {
        
        let view = UIView(frame: self.bounds)
        view.tag = 92
        
        let activity = UIActivityIndicatorView(frame: CGRect(origin: view.center, size: CGSize(width: 40, height: 40)))
        
        activity.activityIndicatorViewStyle = .white
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
