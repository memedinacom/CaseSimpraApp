//
//  SettingableViewCell.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN on 12/5/18.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit
protocol SettingTableViewCellDelegate {
    func didSelectCell(_ data:Any)
}

class SettingTableViewCell: UITableViewCell {
    @IBOutlet weak var lbnTitle: UILabel!
    var dataCell:Any?

    public var perDelegate:SettingTableViewCellDelegate!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tapGestureForNameLabel = UITapGestureRecognizer(target: self, action: #selector(self.didSelectCell))
        self.addGestureRecognizer(tapGestureForNameLabel)
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Didselect Cell call delegate functions
    @objc func didSelectCell(){
        perDelegate.didSelectCell(dataCell)
    }
    
    //Prepare UI from data
    func updateData(data:Any){
 
    }

    
}
