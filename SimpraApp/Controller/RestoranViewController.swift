//
//  ViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 27.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import CoreData

class RestoranViewController: UIViewController {
    struct Score {
        let score : Int
        let destination : String
        let name : String
        let emoji : String
    }

    var allScores = [MenuItem]()
    @IBOutlet private weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBarItems()
        self.configure()
        
         NewLoadingView.shared.show()
               
        SimpraApi.products.fetchs(type: ProductResponseModel.self) { [weak self] (response, error) in
            NewLoadingView.shared.hide()
            self!.allScores = (self?.sortProduct())!
            self?.collectionView.reloadData()
            
        }

        
    }
    
    private func configure() {

        let nib = UINib(nibName: "ProductPreviewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductPreviewCell")
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
    }

   func sortProduct() -> [MenuItem]{
              var arr = DataManager.sharedInstance.productModel?.menuItems
              
              arr?.sort(by: { (item1, item2) -> Bool in
                  if(item1.group?.id == "TWVudUl0ZW1Hcm91cC01MWNkZGQ5Zi01OGQ5LTRmZWMtYTRiNy03YTRlYmVjZjc3MGY="){
                      return true
                  }
                  return false
              })
    
   
                return arr ?? []
          }

}

extension RestoranViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ProductPreviewCellDelegate {
    func didSelectPost(with id: String) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allScores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductPreviewCell", for: indexPath) as! ProductPreviewCell
        cell.setup(self, post: allScores[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellInset: CGFloat = 20.0 // for 3 cells per row
        let fullWidth = UIScreen.main.bounds.size.width
        let cellSize: CGFloat = (fullWidth - cellInset) / 2.0
        
        return CGSize(width: cellSize, height: cellSize/1.5)
    }
}
