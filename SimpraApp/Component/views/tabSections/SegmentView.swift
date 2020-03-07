//
//  SegmentView.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN  on 10/22/18.
//  Copyright © 2020 Nuevo MacPro13. All rights reserved.
//

import UIKit

protocol SegmentViewDelegate: NSObjectProtocol {
    func didSelectCell(_ data: Any)
    func didSubSelectCell(_ data: Any , indexPath index:Int)
}

public struct SegmentItem {
    var title:String?
    var id:String?
    var subList:[Any]?
}
public struct SubSegmentItem {
    var title:String?
    var id:String?
    var parentId:String?
}
enum SegmentType{
    case group
    case subGroup
}

class SegmentView: UIView, NibReusable {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabe: RoundedButton!
    
    
    @IBOutlet weak var collectionViewHeightConstrait: NSLayoutConstraint!
    @IBOutlet private weak var collectionViewTab: UICollectionView!
    // MARK: - Properties
    
    
    var selectData:Any?
    var dataList:[Any] = []
    var cellSize:Int = 0
    var isLoadedData = true
    var typeOfSegment:SegmentType = .group
    weak var delegate: SegmentViewDelegate?
    var selectSubGorupIndex:Int = 0
    
    // MARK: - Lifecyle
    
    convenience init(with _delegate: SegmentViewDelegate) {
        self.init()
        self.delegate = _delegate
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        ownFirstNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ownFirstNib()
        setup()
    }
    
    //Collectionview Layout
    func flowCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    // MARK: - Functions
    
    //Register Ceollectionview Nib
    func setup() {
        
        let nib = UINib(nibName: SEGMENT_OF_COLLECTION_VCELL, bundle: nil)
        collectionViewTab.register(nib, forCellWithReuseIdentifier: SEGMENT_OF_COLLECTION_VCELL)
        
        let nibSub = UINib(nibName: SUBSEGMENT_OF_COLLECTION_VCELL, bundle: nil)
        collectionViewTab.register(nibSub, forCellWithReuseIdentifier: SUBSEGMENT_OF_COLLECTION_VCELL)
        self.flowCollectionView()
        
    }
    
    // MARK: - Configuration UI
    private func configurateView(data:SegmentItem){
        self.titleLabe.setTitle(data.title, for: .normal)
    }
    
    // MARK: Fetch Data
    public func loadData(_ data:[Any],
                         type:SegmentType? = .group ,
                         completion: @escaping (_ isSucces:Bool) -> Void) {
        typeOfSegment = type ?? SegmentType.group
        self.dataList = data
        
        completion(true)
        self.collectionViewTab.reloadData()
    }
    
}

// MARK: - Extensions
extension SegmentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch typeOfSegment {
        case .group:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SEGMENT_OF_COLLECTION_VCELL, for: indexPath) as! SegmentOfCollectionVCell
            
            cell.updateData(dataList[indexPath.row])
            cell.perDel = self
            self.setNeedsDisplay()
            self.layoutIfNeeded()
            return cell
        case .subGroup:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SUBSEGMENT_OF_COLLECTION_VCELL, for: indexPath) as! SubSegmentOfCollectionVCell
            
            cell.updateData(dataList[indexPath.row])
            cell.perDel = self
            cell.tag = indexPath.row
            selectSubGorupIndex == indexPath.row ? cell.selectButton(): cell.deSelectButton()
            
            self.setNeedsDisplay()
            self.layoutIfNeeded()
            return cell
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Segment widht hesplanması
        var strValue = ""
        if let item = dataList[indexPath.row] as? SubSegmentItem{
            strValue = item.title!
        }
        if let item = dataList[indexPath.row] as? SegmentItem{
            strValue = item.title!
        }
        let width = self.estimatedFrame(text: strValue, font: UIFont.helveticaNeueBold).width + 50
        
        return CGSize(width: width, height: 50)
    }
    
    
    // MARK: - estimatedFrame section
    func estimatedFrame(text: String, font: UIFont) -> CGRect {
        let size = CGSize(width: 200, height: 1000) // temporary size
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size,
                                                   options: options,
                                                   attributes: [NSAttributedString.Key.font: font],
                                                   context: nil)
    }
    
//    func resetSubCell(_ index:Int? = 0){
//        for cell in collectionViewTab.visibleCells as [UICollectionViewCell] {
//            
//            if let subCell = cell as? SubSegmentOfCollectionVCell{
//                subCell.deSelectButton()
//                (subCell.tag  == index) ? subCell.selectButton() : subCell.deSelectButton()
//            }
//        }
//    }
}

// MARK: - Protocol- SegmentCellDelagate
extension SegmentView: SegmentCellDelagate {
    
    func didSelectCell(_ data: Any) {
        delegate?.didSelectCell(data)
    }
}


// MARK: - Protocol- SubSegmentCellDelagate

extension SegmentView: SubSegmentCellDelagate {
    func didSubSelectCell(_ data: Any, indexPath index: Int) {
        selectSubGorupIndex = index
        delegate?.didSubSelectCell(data, indexPath: index)
    }

    
}
