//
//  LoadingHandler.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation

import UIKit
import Lottie


/**
 
 loading static instance'dan show(on <#UIView#>, <#message?#>) ya da UIView'den türemiş bir class'da 'showLoading(<#message?#>)' fonksiyonu ile gösterilebilir.
 static instance'dan çağırıldığında tüm ekranda gösterilir.
 view'dan çağrıldığında view'ın bounds'una göre boyutlandırılır.
 show ve hide event'ları UI thread'de async olarak işlenir.
 */
class NewLoadingView: UIView {
    
    public static let shared = NewLoadingView()
    
    private var activityIndicator: AnimationView!
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        activityIndicator = AnimationView(name: "simpra-liquid-loading")
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        activityIndicator.center = self.center
        activityIndicator.loopMode = .loop
        activityIndicator.backgroundColor = .clear
        addSubview(activityIndicator)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show(on view: UIView? = nil, message: String? = nil) {
        self.backgroundColor = .clear
        DispatchQueue.main.async {
            
            self.alpha = 0
            if let view = view {
                
                self.frame = view.bounds
                
                view.addSubview(self)
            } else {
                
                let window = UIApplication.shared.keyWindow!
                self.frame = window.frame
                self.center = window.center
                window.addSubview(self)
            }
            
            self.activityIndicator.center = self.center
            self.activityIndicator.play()
      
            UIView.animate(withDuration: 0.3, animations: { self.alpha = 1 })
        }
    }
    
    public func hide() {
        
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.3, animations: { self.alpha = 0 }, completion: { _ in
                
                self.activityIndicator.stop()
                self.removeFromSuperview()
            })
        }
    }
}
