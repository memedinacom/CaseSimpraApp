//
//  ProfileViewOfGonderi.swift
//  SpoorcuIOS
//
//  Created by Mehmet ZEYTIN  on 10/22/18.
//  Copyright © 2018 Nuevo MacPro13. All rights reserved.
//

import UIKit

protocol ProfileViewOfGonderiDelegate: NSObjectProtocol {
    func didSelectCell(_ data: PostItemData)
}

class ProfileViewOfGonderi: UIView, NibReusable {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var sportLabel: UILabel!
    @IBOutlet private weak var ageAndCityLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var visitinCountLabel: UILabel!
  
    @IBOutlet weak var collectionViewHeightConstrait: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var pageSize:Int = 12
    var pageCount:Int = 1
    
    var dataList:[PostItemData] = []
    var cellSize:Int = 0
    var isLoadedData = true
    weak var delegate: ProfileViewOfGonderiDelegate?
    
    // MARK: - Lifecyle
    
    convenience init(with _delegate: ProfileViewOfGonderiDelegate) {
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
    
    // MARK: - Functions
    
    func setup() {
        
        collectionView.register(UINib(nibName: "SegmentOfCollectionVCell", bundle: nil), forCellWithReuseIdentifier: "SegmentOfCollectionVCell")
    }
    
  private func configureInfoZone(with profile: (belongToMe: Bool,
        name: String,
        sport: String,
        age: Int,
        city: String,
        description: String,
    numberOfVisit: Int)) {
    
    infoLabel.text = profile.name
    sportLabel.text = profile.sport
    var age =  ""
    if(profile.age > 0){
        age =  String(format:" %d yaş",profile.age )
    }
    
    ageAndCityLabel.text = (profile.city == "") ? age : String(format: "%@, %@",age , profile.city)
    descriptionLabel.text = profile.description
    visitinCountLabel.text = profile.belongToMe ? String(format: "%d görüntülenme", profile.numberOfVisit) : nil
    
  }
    
    public func loadData(_ profileID:Int ,completion: @escaping (_ isSucces:Bool) -> Void) {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        if(!isLoadedData){ completion(false)}
        ProfilesAPI.profilesByUserIdPost(userId: profileID) { (data:ResponseModelOfAppUserDetailModel?, error:Error?) in
            guard let data:AppUserDetailModel = data?.data else {
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                completion(false)
                return
            }
          
            let profileBelongMe = data.id == UserManager.sharedInstance.currentUser.id
          
            self.configureInfoZone(with: (profileBelongMe,
                                          data.fullName ?? "",
                                          data.sportName ?? "",
                                          data.age ?? 0,
                                          data.cityName ?? "",
                                          data.description ?? "",
                                          data.viewCount ?? 0))
            
            PostsAPI.postsByUserIdMeGet(userId: profileID, pageIndex: self.pageCount, pageSize: self.pageSize) { (data:ResponseModelOfListOfPostItemData?, error:Error?) in
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.isLoadedData = true
                if let myData = data?.data {
                                        
                    self.collectionView.setBackgroundMessage()
                    if self.pageCount == 1 {
                        self.dataList.removeAll()
                    }
                    self.dataList.append(contentsOf: myData)
                    
                    self.collectionView.reloadData()
                    //self.layoutIfNeeded()
                    //self.viewDidLayoutSubviews()
                    self.pageCount = self.pageCount + 1
                    completion(true)
                    
                } else {
                    
                    guard self.dataList.isEmpty else { completion(true); return }
                  
                    let message = profileBelongMe ? "label_my_profile_post_less_title" : "label_another_profile_post_less_title"
                    self.collectionView.setBackgroundMessage(message.localized())
                    
                    self.collectionView.translatesAutoresizingMaskIntoConstraints = false

                    self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
                    self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
                    
                    completion(false)
                }
            }
        }
    }
    
    
    func viewDidLayoutSubviews() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.collectionViewHeightConstrait.constant = CGFloat(self.collectionView.contentSize.height)
            self.collectionView.layoutIfNeeded()
            self.layoutIfNeeded()
        }
    }
    
    public func updateLayout(frame:CGRect) {
        
        cellSize = Int((frame.size.width-3) / 3)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView!.collectionViewLayout = layout
        self.setUpCollectSize(count: dataList.count)
    }
    
    func setUpCollectSize(count:Int) {
        
        let CollectHeight = cellSize * (dataList.count/3) + cellSize + 20
        self.collectionViewHeightConstrait.constant =  CGFloat(CollectHeight )
        self.layoutIfNeeded()
        self.setNeedsDisplay()
    }
}

extension ProfileViewOfGonderi: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentOfCollectionVCell", for: indexPath) as! SegmentOfCollectionVCell
      
//      let isImage = dataList[indexPath.row].contentMeta!.count
        cell.updateData(dataList[indexPath.row])
        cell.perDel = self
        self.setNeedsDisplay()
        self.layoutIfNeeded()
        return cell
    }
}

extension ProfileViewOfGonderi: GonderiCellDelagate {

    func didSelectCell(_ data: PostItemData) {

        delegate?.didSelectCell(data)
    }
}
