//
//  BaseRoundedTextFied.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 1.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//


import Foundation
import UIKit
@IBDesignable class RoundedTextField : UITextField{
    @IBInspectable var borderColor: UIColor = UIColor.orange {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
        
       
    }
    @IBInspectable var selectedBorderColor: UIColor = UIColor.orange
    
    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    public var maxLength = 60
    public var isfirstCapitalLetter = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.5
        self.borderStyle = UITextField.BorderStyle.none
        //self.textAlignment = .center
        self.frame.size.height = 80
        self.delegate = self
        self.font = UIFont.helveticaNeue
        self.tintColor = UIColor.slateGrey
        self.selectedBorderColor = UIColor.orange1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.5
        self.selectedBorderColor = UIColor.orange1
        self.borderStyle = UITextField.BorderStyle.none
        //self.textAlignment = .center
        self.delegate = self
        setLeftPaddingPoints(10)
        setRightPaddingPoints(10)
        
    }
}
extension RoundedTextField : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(isfirstCapitalLetter){
            textField.text? = textField.text?.capitalized ?? ""
        }
        if(string == ""){
            return true
        }
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= maxLength
    }
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.layer.borderColor = selectedBorderColor.cgColor
        return true
    }
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.layer.borderColor = borderColor.cgColor
        return true
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
}
extension UITextField {
    
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
