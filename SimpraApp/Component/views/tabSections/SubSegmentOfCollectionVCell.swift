//
//  SegmentOfCollectionVCell.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN on 01.03.2018.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit
protocol SubSegmentCellDelagate: class {
    
    func didSubSelectCell(_ data:Any , indexPath index:Int)
    // func didSelectVideoFullScreenCell()->VideoView
}
class SubSegmentOfCollectionVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var button:UIButton?
    
    // MARK: - Properties
    
    public weak var perDel: SubSegmentCellDelagate?
    
    private var itemData:Any!
    
    
    
    
    // MARK: - Functions
    
    
    func updateData(_ data:Any){
        self.itemData = data
        if let item = data as? SubSegmentItem{
            self.button?.setTitle(item.title, for: .normal)
        }
    }
    
    @IBAction func selectButton(){
        //button?.backgroundColor = UIColor.orange
        //button?.titleLabel?.textColor = UIColor.white
    }
    
    
    public func deselect(){
        //button?.backgroundColor = UIColor.white
        //button?.titleLabel?.textColor = UIColor.darkGray
    }
    func deSelectButton(){
        self.deselect()
    }
    
    @IBAction func didSelectCell(_ sender: Any) {
        
        if(perDel != nil){
            
            perDel?.didSubSelectCell(itemData, indexPath: self.tag)
        }
    }
}
