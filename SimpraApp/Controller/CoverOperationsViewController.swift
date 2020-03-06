//
//  CoverOperations.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 4.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit

public struct CoverModel {
    var title:String?
    var image:UIImage?
}

class CoverOperationsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var list:[CoverModel] = []
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        self.configurationVc()
        self.loadData()
        self.tableView.reloadData()
    }
    
    // MARK: Fetch Data
    func loadData(){
        self.list.append(CoverModel(title: "Kadın", image: UIImage(named: "female")))
        self.list.append(CoverModel(title: "Erkek", image: UIImage(named: "male")))
        self.list.append(CoverModel(title: "Çocuk", image: UIImage(named: "baby")))
    }
    
    //Configuraiton View Controller
    func configurationVc(){
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName:"CoverOperationCellTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "CoverOperationCellTableViewCell")
        tableView.separatorColor = UIColor.lightText
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


// MARK: - Extensions
extension CoverOperationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoverOperationCellTableViewCell",
                                                 for: indexPath) as! CoverOperationCellTableViewCell
        cell.updateData(data: list[indexPath.row])
        
        return cell;
    }
    
}


// MARK: - Properties
// MARK: - Functions
// MARK: - Actions


