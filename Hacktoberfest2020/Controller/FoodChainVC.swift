//
//  FoodChainVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit
import BBBadgeBarButtonItem

class FoodChainVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let foodChainViewId = "foodChainViewId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Restaurant"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FoodChainViewCell", bundle: nil), forCellWithReuseIdentifier: foodChainViewId)
        
        let backBtn = UIBarButtonItem()
        backBtn.title = ""
        navigationItem.backBarButtonItem = backBtn
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cartBtn = UIButton()
        cartBtn.setImage(UIImage(named: "cart"), for: .normal)
        
        let item = BBBadgeBarButtonItem(customUIButton: cartBtn)
        item?.badgeValue = "10"
        self.navigationItem.rightBarButtonItem = item
    }
   

}

extension FoodChainVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodChainViewId, for: indexPath) as! FoodChainViewCell
        cell.image = UIImage(named: "KFC")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(view.frame.width)
        print(view.bounds.width)
        return CGSize(width: view.frame.width / 2 - 8 , height: view.frame.width / 2 - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 4, bottom: 4, right: 4)
    }
    
}
