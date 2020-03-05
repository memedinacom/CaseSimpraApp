//
//  SegmentOfCollectionVCell.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN on 01.03.2018.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit
protocol SegmentCellDelagate: class {
    
    func didSelectCell(_ data:Any)
    // func didSelectVideoFullScreenCell()->VideoView
}
class SegmentOfCollectionVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var button:RoundedButton?
    
    // MARK: - Properties
    
    public weak var perDel: SegmentCellDelagate?
    
    private var itemData:Any!
    
    
    
    
    // MARK: - Functions
    
    func updateData(_ data:Any){
        self.itemData = data
        if let item = data as? SegmentItem{
            self.button?.setTitle(item.title, for: .normal)
        }
    }
    
    @IBAction func selectButton(){
        //button?.backgroundColor = UIColor.orange
        //button?.titleLabel?.textColor = UIColor.white
    }
    
    @IBAction func deSelectButton(){
        //button?.tintColor = UIColor.white
        //button?.titleLabel?.textColor = UIColor.lightGray
    }
    
    @IBAction func didSelectCell(_ sender: Any) {
        
        if(perDel != nil){
            
            perDel?.didSelectCell(itemData)
        }
    }
}
