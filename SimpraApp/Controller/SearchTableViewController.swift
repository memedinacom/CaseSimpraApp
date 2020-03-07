//
//  SearchTableViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 6.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

class SearchTableViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    var dataList:[Table] = []
    var filteredDataList:[Table] = []
    var isFiltering: Bool = false
    var delegate:ChangeTableItemProtocol?
    var selectData:Table?
    
    override func prepareNavigationBar() {
        super.prepareNavigationBar()
        self.setupSearchBarNavItem()
        self.loadData()
        self.setup()
    }
    
    //Register Ceollectionview Nib
    func setup() {
        let nib = UINib(nibName: TABLE_COLLECTIONS_CELL, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: TABLE_COLLECTIONS_CELL)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.flowCollectionView()
    }
    
    // MARK: Fetch Data
    public func loadData() {
        guard let data = DataManager.sharedInstance.tablesModel?.tables else {
            return
        }
        
        self.dataList = data
        self.collectionView.reloadData()
        collectionView.setEmptyDataView()
    }
    
    //Collectionview Layout
    func flowCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private func setupSearchBarNavItem() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.barTintColor = UIColor.navGrey
            navigationController?.view.backgroundColor = UIColor.darkGray
            navigationController?.navigationItem.hidesBackButton = false
            let searchController = UISearchController(searchResultsController: nil) // Search Controller
            searchController.searchBar.delegate = self
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController
            navigationItem.backBarButtonItem?.tintColor = .darkGray
            self.navigationController?.navigationBar.tintColor = UIColor.white

        }
        
    }
    
    @objc func backButtonAction(){
        
    }
    
    //Filter Array functions
    func filterContentForSearchText(text:String){
        //text boş ise cache data okunuyor.
        if (text.isEmpty){
            isFiltering = false
        } else{
            isFiltering = true
        }
        
        //Büyük küçük harf hassasiyeti ile contains search ediyor.
        filteredDataList = dataList.filter { ($0.name!).range(of: text, options: [.diacriticInsensitive, .caseInsensitive]) != nil }
        self.collectionView.reloadData()
    }
}


// MARK: - UISearchBarDelegate
extension SearchTableViewController:UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isEditing = false
        self.collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(text: searchBar.text!)
    }
}

// MARK: - UICollectionViewDelegate
extension SearchTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return self.filteredDataList.count
        }else{
            return self.dataList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TABLE_COLLECTIONS_CELL, for: indexPath) as! TableCollectionsCell
        
        if isFiltering {
            cell.setup(self, post: filteredDataList[indexPath.row])
        }else{
            cell.setup(self, post: dataList[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == ViewControllerSegue.SearchToFastFood.rawValue {
            let destination = segue.destination as? FastFoodViewController
            destination?.selectData = selectData
        }
    }
    
}

// MARK: - TableCollectionsCellDelagete
extension SearchTableViewController:TableCollectionsCellDelagete{
    func didSelectTable(with id: String, SelectData data: Any) {
        selectData = data as? Table
        self.navigationController?.popViewController(animated: true)
        performSegue(withIdentifier: ViewControllerSegue.SearchToFastFood.rawValue, sender: nil)
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(text:searchBar.text!)
    }
}
