//
//  SegmentOfCollectionVCell.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN on 01.03.2018.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit
protocol SubSegmentCellDelagate: class {
    
    func didSubSelectCell(_ data:Any)
    // func didSelectVideoFullScreenCell()->VideoView
}
class SubSegmentOfCollectionVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var button:RoundedButton?
    
    // MARK: - Properties
    
    public weak var perDel: SubSegmentCellDelagate?
    
    private var itemData:MenuItem!
    
    
    
    
    // MARK: - Functions
    
    func updateData(_ data:Any){
        if let item = data as? SegmentItem{
            self.button?.setTitle(item.title, for: .normal)
        }
    }
    
    @IBAction func selectButton(){
        button?.backgroundColor = UIColor.orange
        button?.titleLabel?.textColor = UIColor.white
    }
    
    @IBAction func deSelectButton(){
        button?.tintColor = UIColor.white
        button?.titleLabel?.textColor = UIColor.lightGray
    }
    
    @IBAction func didSelectCell(_ sender: Any) {
        
        if(perDel != nil){
            
            perDel?.didSubSelectCell(itemData)
        }
    }
}
