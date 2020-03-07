//
//  SimpraEmptyView.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 7.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

class SimpraEmptyView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLAbel: UILabel!
    var titleString :String?{
        didSet{
            titleLAbel.text = titleString
            titleLAbel.isHidden = false
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        ownFirstNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ownFirstNib()
        setup()
    }

    func setup(){
        self.alpha = 0.5
    }
}
