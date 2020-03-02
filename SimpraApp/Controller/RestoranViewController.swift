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

    @IBOutlet weak var segmentView: SegmentView!
    @IBOutlet weak var subSegmentView: SegmentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareUI()
        self.configure()
        
         NewLoadingView.shared.show()
               
        SimpraApi.products.fetchs(type: ProductResponseModel.self) { [weak self] (response, error) in
            NewLoadingView.shared.hide()
            self!.allScores = (self?.sortProduct())!
            self?.collectionView.reloadData()
            
            var items = SegmentItem()
                 items.title = "Sıcak içecek"
            
            var items1 = SegmentItem()
                            items1.title = "Sıcak  sfs içecek"
            
            var items2 = SegmentItem()
                            items2.title = " içecek"
            
            var items3 = SegmentItem()
                            items3.title = "Sıcasdfsd k içecek"
            
            self!.segmentView.loadData([items,items1 , items2, items3, items, items, items, items2, items1] ) { (response) in
                
                self!.subSegmentView.loadData([items2,items , items, items2, items, items1, items2, items2, items2], type:.subGroup) { (response) in
                               
                               
                           }
                
                
            }
            
        }
       
        
    }
    
    private func prepareUI(){
        self.setupNavigationBarItems()
        self.view.backgroundColor = UIColor.lightGray
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
        
        let cellInset: CGFloat = 20 // for 2 cells per row
        let fullWidth = UIScreen.main.bounds.size.width
        let cellSize: CGFloat = (fullWidth - cellInset) / 2.0
        
        return CGSize(width: cellSize, height: cellSize/1.5)
    }
}
