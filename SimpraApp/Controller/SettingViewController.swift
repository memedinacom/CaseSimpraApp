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
    
    @IBAction func clickFastFood(_ sender: Any) {
        self.dismiss(animated: true) { [weak self] in
            self?.goFastFoodViewController()
        }
    }
    
    @IBAction func clickRestoran(_ sender: Any) {
        self.dismiss(animated: true){  [weak self] in
            self?.goRestoranViewController()
        }
    }
    
    //Configuration Viewc Controller
    func configurationVc(){
        tableView.map {
            $0.estimatedRowHeight = 120
            $0.rowHeight = UITableView.automaticDimension
            $0.register(UINib(nibName:SETTING_TABLEVIEW_CELL, bundle: nil), forCellReuseIdentifier: SETTING_TABLEVIEW_CELL)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SETTING_TABLEVIEW_CELL, for: indexPath) as! SettingTableViewCell
        cell.perDelegate = self
        cell.lbnTitle.text = "Ayarlar  \(indexPath.row)"

        return cell;
    }
    
}


