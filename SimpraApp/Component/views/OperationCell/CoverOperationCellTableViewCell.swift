//
//  CoverOperationCellTableViewCell.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 4.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

class CoverOperationCellTableViewCell: UITableViewCell {
    @IBOutlet private  var imgView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    var stepCount = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //Prepera UI CollecitonViewCell from Data
    func updateData(data:Any){
        if let item = data as? CoverModel{
            self.titleLabel.text = item.title
            self.imgView.image = item.image
        }
    }
    
    //Right step click increate step number count +1
    @IBAction func righStepClick(_ sender: Any) {
        stepCount+=1
        self.countLabel.text = String(stepCount)
    }
    
    //Left step click increate step number count +1
    @IBAction func leftStepClick(_ sender: Any) {
        stepCount = stepCount<1 ? 0:stepCount-1
        self.countLabel.text = String(stepCount)
    }
}
