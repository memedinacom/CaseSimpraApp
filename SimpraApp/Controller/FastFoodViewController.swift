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

class FastFoodViewController: BaseViewController {
    var productList:[MenuItem] = []
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentView: SegmentView!
    @IBOutlet weak var subSegmentView: SegmentView!
    var selectData:Table?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareUI()
        self.configure()
        
        NewLoadingView.shared.show()
        self.fetchData()
        
    }
    
    // MARK: - Create Dummy Data
    fileprivate func fetchData(){
        SimpraApi.products.fetchs(type: ProductResponseModel.self) { [weak self] (response, error) in
            NewLoadingView.shared.hide()
            self?.collectionView.setEmptyDataView(title:"Ardağınız Ürün Bulunamadı")
            let itemEtiket = SegmentItem(title: "Etiketler",
                                         id: "1" ,
                                         subList: [SubSegmentItem(title: "Çok Satanlar",
                                                                  id: "11",
                                                                  parentId: "1"),
                                                   SubSegmentItem(title: "Etiket 1",
                                                                  id: "12",
                                                                  parentId: "1"),
                                                   SubSegmentItem(title: "Etiket 2",
                                                                  id: "12",
                                                                  parentId: "1"),
                                                   SubSegmentItem(title: "Etiket 3",
                                                                  id: "13",
                                                                  parentId: "1"),
                                                   SubSegmentItem(title: "Etiket 4",
                                                                  id: "14",
                                                                  parentId: "1"),
                                                   SubSegmentItem(title: "Etiket 5",
                                                                  id: "15",
                                                                  parentId: "1")]
            )
            
            let itemIcecek = SegmentItem(title: "İçecekler",
                                         id: "2",
                                         subList: [SubSegmentItem(title: "Soğuk İçecekler",
                                                                  id: "21",
                                                                  parentId: SegmentProductId.coldDrink.rawValue),
                                                   SubSegmentItem(title: "Sıcak İçecekler",
                                                                  id: "22",
                                                                  parentId: SegmentProductId.hotDrink.rawValue)])
            
            
            let itemYiyecek = SegmentItem(title: "Yiyecekler",
                                          id: "3",
                                          subList: [SubSegmentItem(title: "Ana Yemekler",
                                                                   id: "31",
                                                                   parentId: SegmentProductId.mainCourse.rawValue),
                                                    SubSegmentItem(title: "Çorbalar",
                                                                   id: "32",
                                                                   parentId: SegmentProductId.soup.rawValue),
                                                    SubSegmentItem(title: "Tatlılar",
                                                                   id: "33",
                                                                   parentId: SegmentProductId.dessert.rawValue)])
            
            self?.productList = self?.sortProduct("") ?? []
            self?.subSegmentView.loadData( itemEtiket.subList!,
                                           type:.subGroup) { (response) in
            }
            self?.collectionView.reloadData()
            
            
            self!.segmentView.loadData([itemEtiket,
                                        itemIcecek,
                                        itemYiyecek] ) { (response) in}
            
        }
    }
    
    //Prepare UI for Viewcontroller
    private func prepareUI(){
        self.setupNavigationBarItems()
        self.view.backgroundColor = UIColor.lightGray
    }
    
    //Configuraiton View Controller
    private func configure() {
        self.segmentView.delegate = self
        self.subSegmentView.delegate = self
        
        let nib = UINib(nibName: PRODUCT_PREVIEW_CELL, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PRODUCT_PREVIEW_CELL)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
    }
    
    //Sort Product Lise with group id like Fast Food  , Hot Drink , Cold Drink
    func sortProduct(_ groupId:String) -> [MenuItem]{
        var arr = DataManager.sharedInstance.productModel?.menuItems
        if groupId.isEmpty{ return arr! }
        
        arr = arr?.filter({ (item1) -> Bool in
            item1.group?.id == groupId
        })
        
        return arr ?? []
    }   
}

// MARK: Extensions
extension FastFoodViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ProductPreviewCellDelegate {
    func didSelectPost(with id: String) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PRODUCT_PREVIEW_CELL, for: indexPath) as! ProductPreviewCell
        cell.setup(self, post: productList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellInset: CGFloat = 20 // for 2 cells per row
        let fullWidth = UIScreen.main.bounds.size.width
        let cellSize: CGFloat = (fullWidth - cellInset) / 2.0
        
        return CGSize(width: cellSize, height: cellSize/1.5)
    }
}



extension FastFoodViewController:SegmentViewDelegate{
    func didSubSelectCell(_ data: Any, indexPath index: Int) {
        if let data = data as? SubSegmentItem{
            self.productList = self.sortProduct(data.parentId ?? "")
            self.collectionView.reloadData()
            //self.segmentView.resetSubCell()
        }
        
    }
    
    
    func didSelectCell(_ data: Any) {
        
        if let subData = data as? SegmentItem{
            self.subSegmentView.loadData( subData.subList ?? [],
                                          type:.subGroup) { (response) in
                                            //self.subSegmentView.resetSubCell()
                                            
            }
        } }
    
}
