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
    var sectionList:[SegmentItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareUI()
        self.configure()
        
        NewLoadingView.shared.show()
        self.fetchData()
        
    }
    
    // MARK: - Create Dummy Data
    fileprivate func fetchData(){
        SimpraApi.groups.fetchs(type: GroupsResponseModel.self) { [weak self] (response , error) in
            for section in response!.menuItemGroups! {
                var sectionItem = SegmentItem(title: section.name, id: section.id, subList: [])
                var subSectionList:[SubSegmentItem] = []
                for subSection in section.groups!{
                    let subSegmentItemModel = SubSegmentItem(title: subSection.name,
                                                        id: "1",
                                                        parentId: subSection.id)
                   
                    subSectionList.append(subSegmentItemModel)
                }
                sectionItem.subList = subSectionList
                self!.sectionList.append(sectionItem)
            }
            
            // MARK: - FetchProduct
            self?.fetchProducts()
        }
    
    
    }
    
    // MARK: - Fetch Products Data
    func fetchProducts(){
        SimpraApi.products.fetchs(type: ProductResponseModel.self) { [weak self] (response, error) in
                NewLoadingView.shared.hide()
                self?.collectionView.setEmptyDataView(title:"Ardağınız Ürün Bulunamadı")
            
                self?.productList = self?.sortProduct("") ?? []
                self?.subSegmentView.loadData( self!.sectionList[0].subList!,
                                               type:.subGroup) { (response) in
                }
                self?.collectionView.reloadData()
                
                
                self!.segmentView.loadData(self!.sectionList ) { (response) in}
                
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
        let cellSize: CGFloat = (fullWidth - cellInset - 16) / 2.0
        
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
