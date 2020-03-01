//
//  RoundedButton.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//


import UIKit

class RoundedButton: UIButton {
    
    
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = 20
        self.titleLabel?.font = UIFont.helveticaNeueBold
        self.backgroundColor = UIColor.orange3
        self.tintColor = UIColor.white
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.titleEdgeInsets.top = 0
        self.titleEdgeInsets.left = 10
        self.titleEdgeInsets.bottom = 0
        self.titleEdgeInsets.right = 10
    }
    func setOrangeColorButton(){
        self.backgroundColor = UIColor.orange
        self.tintColor = UIColor.white
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x,
                                 y: frame.origin.y,
                                 width: frame.size.width,
                                 height: 50))
        
        prepareForInterfaceBuilder()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareForInterfaceBuilder()
        
    }
    
}
extension UIButton {
    static public func systemButton(title: String? = nil, image: UIImage? = nil, titleColor: UIColor? = .white, font: UIFont? = nil, target: Any? = nil, selector: Selector? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        if let selector = selector {
            button.addTarget(target, action: selector, for: .touchUpInside)
        }
        return button
    }
}