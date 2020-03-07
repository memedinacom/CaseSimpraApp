//
//  TableCollectionsCell.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 6.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

protocol TableCollectionsCellDelagete: NSObjectProtocol {
    func didSelectTable(with id: String , SelectData data:Any)
}
class TableCollectionsCell: UICollectionViewCell {
    
    @IBOutlet weak var titleButton: UIButton!
    // MARK: - Outlets
    
    // MARK: - Properties
    
    weak var delegate: TableCollectionsCellDelagete?
    private var product: Table!
    
    // MARK: - Lifecyle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareUI()
    }
    
    // MARK: - Functions
    func prepareUI(){
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowOffset = self.frame.size
        self.layer.shadowColor = UIColor.gray.cgColor
        self.titleButton.tintColor = .black
        self.titleButton.titleLabel?.font = .helveticaMedium16
    }
    
    func setup(_ delegate: TableCollectionsCellDelagete, post: Table) {
        
        self.delegate = delegate
        self.titleButton.setTitle(post.name, for: .normal)
        self.product = post
    }
    
    @IBAction private func didSelect() {
        self.delegate?.didSelectTable(with: product.id!, SelectData: self.product!)
    }
}



