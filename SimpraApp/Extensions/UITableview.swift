//
//  UITableview.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 7.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import UIKit
import EmptyDataSet_Swift

extension UITableView{

    func setEmptyDataView(title:String? = ""){
        let emptyView = SimpraEmptyView()
        if !title!.isEmpty{
            emptyView.titleString = title
        }
        self.emptyDataSetView { [weak self] view in
            view.customView(emptyView)
        }
    }
}


extension UICollectionView{
   func setEmptyDataView(title:String? = ""){
        let emptyView = SimpraEmptyView()
        if !title!.isEmpty{
            emptyView.titleString = title
        }
        self.emptyDataSetView { [weak self] view in
            view.customView(emptyView)
        }
    }
}
