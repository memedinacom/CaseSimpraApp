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
}

public struct SegmentItem {
    var title:String?
    var id:String?
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
    
    
    
    var dataList:[SegmentItem] = []
    var cellSize:Int = 0
    var isLoadedData = true
    var typeOfSegment:SegmentType = .group
    weak var delegate: SegmentViewDelegate?
    
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
    
    func flowCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //layout.minimumLineSpacing = 2
        //layout.minimumInteritemSpacing = 2
        //self.collectionViewTab?.collectionViewLayout = layout
    }
    
    // MARK: - Functions
    
    func setup() {
        
        let nib = UINib(nibName: "SegmentOfCollectionVCell", bundle: nil)
        collectionViewTab.register(nib, forCellWithReuseIdentifier: "SegmentOfCollectionVCell")
        
        let nibSub = UINib(nibName: "SubSegmentOfCollectionVCell", bundle: nil)
        collectionViewTab.register(nibSub, forCellWithReuseIdentifier: "SubSegmentOfCollectionVCell")
        self.flowCollectionView()
        
    }
    
    private func configurateView(data:SegmentItem){
        self.titleLabe.setTitle(data.title, for: .normal)
    }
    
    public func loadData(_ data:[SegmentItem],
                         type:SegmentType? = .group ,
                         completion: @escaping (_ isSucces:Bool) -> Void) {
        typeOfSegment = type ?? SegmentType.group
        self.dataList = data
        self.collectionViewTab.reloadData()
        completion(true)
    }
    
}



extension SegmentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch typeOfSegment {
        case .group:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentOfCollectionVCell", for: indexPath) as! SegmentOfCollectionVCell
            
            cell.updateData(dataList[indexPath.row])
            cell.perDel = self
            self.setNeedsDisplay()
            self.layoutIfNeeded()
            return cell
        case .subGroup:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubSegmentOfCollectionVCell", for: indexPath) as! SubSegmentOfCollectionVCell
            
            cell.updateData(dataList[indexPath.row])
            cell.perDel = self
            self.setNeedsDisplay()
            self.layoutIfNeeded()
            return cell
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Segment widht hesplanması
        let item = dataList[indexPath.row]
        let width = self.estimatedFrame(text: item.title ?? "", font: UIFont.helveticaNeueBold).width + 50
        
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
}

// MARK: - Protocol- SegmentCellDelagate
extension SegmentView: SegmentCellDelagate {
    
    func didSelectCell(_ data: Any) {
        
        delegate?.didSelectCell(data)
    }
}

extension SegmentView: SubSegmentCellDelagate {
    func didSubSelectCell(_ data: Any) {
        
    }
    
}
