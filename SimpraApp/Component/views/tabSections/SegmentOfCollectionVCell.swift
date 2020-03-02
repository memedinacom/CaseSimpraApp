//
//  GonderiOfCollectionVCell.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN on 26.10.2018.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit
protocol GonderiCellDelagate: class {

    func didSelectCell(_ data:PostItemData)
    // func didSelectVideoFullScreenCell()->VideoView
}
class GonderiOfCollectionVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var imgMediaType: UIImageView!
    
    // MARK: - Properties
    
    public weak var perDel: GonderiCellDelagate?
    
    private var itemData:PostItemData!
    private let mediaIcon: (Int?) -> UIImage? = { postTypeId in
        
        switch postTypeId {
            case 1: return UIImage(named: "icnMediaPhoto")
            case 2: return UIImage(named: "icnMediaVideo")
            default: return nil
        }
    }
  
  private func setContentTypeIcon(with isImage: Bool) -> UIImage? {
    
    return isImage ? UIImage(named: "icnMediaPhoto") : UIImage(named: "icnMediaVideo")
  }
    
    // MARK: - Functions
    
    func updateData(_ data:PostItemData){
        
        itemData = data
        let strUrl:String = data.contentMeta!["fileName"] ?? "https://s3.eu-central-1.amazonaws.com/spoorcudev/00/placeholder.jpg"
//        imgMediaType.image = mediaIcon(data.postTypeId)
        imgMediaType.image = setContentTypeIcon(with: (data.contentMeta!.count == 1))
        imgPhoto.kf.setImage(with: Helper.getImagePath(strUrl, .medium).toUrl())
    }
    
  @IBAction func didSelectCell(_ sender: Any) {
    
    if(perDel != nil){
      
      perDel?.didSelectCell(itemData)
    }
  }
}
