//
//  RestoranViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 6.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import UIKit
protocol ChangeTableItemProtocol {
    func selectTableItem(item:Table)
}

class RestoranViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        self.prepareUI()
        tableView.setEmptyDataView(title: "Şuan için isme açılmış açık çek bulunmamaktadır.")
    }
    
    //Prepare UI for Viewcontroller
      private func prepareUI(){
          self.setupNavigationBarItems()
          self.view.backgroundColor = UIColor.lightGray
      }
}

