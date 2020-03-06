//
//  SettingViewController.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 3.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: BaseViewController {
 
    // MARK: - Lifecyle
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.configurationVc()
    }
    
    //Configuration Viewc Controller
    func configurationVc(){
        tableView.map {
            $0.estimatedRowHeight = 120
            $0.rowHeight = UITableView.automaticDimension
            $0.register(UINib(nibName:"SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
            $0.separatorColor = UIColor.lightText
        }
    }
         
}

 // MARK: - Protocol
extension SettingViewController:SettingTableViewCellDelegate{
    func didSelectCell(_ data: Any) {
            //TODO:SegmentView
        }
}

 // MARK: - UITableView Delegate
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        cell.perDelegate = self

        return cell;
    }
    
}


