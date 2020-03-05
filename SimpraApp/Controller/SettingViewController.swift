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
    
    func configurationVc(){
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName:"SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        
        tableView.separatorColor = UIColor.lightText
    }
    
   
}
extension SettingViewController:SettingTableViewCellDelegate{
    func didSelectCell(_ data: Any) {
            
        }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        //cell.setUI(type: .withButton)
        cell.perDelegate = self

        return cell;
    }
    
}


// MARK: - Properties
// MARK: - Functions
// MARK: - Actions

