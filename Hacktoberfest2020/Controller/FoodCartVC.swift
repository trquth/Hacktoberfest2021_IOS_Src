//
//  FoodCartVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 02/10/2021.
//

import UIKit

struct CartCellData {
    var restaurant = ""
    var foods: [String: Any]
    
}

class FoodCartVC: UIViewController {
    
    var collectionViewData = [CartCellData]()
    
    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    let noItemsInCardLabel: UILabel = {
        let label = UILabel()
        label.text = "No Items added to cart"
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Your Cart"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FoodCartCell", bundle: nil), forCellWithReuseIdentifier: "foodCartCellId")
        collectionView.register(UINib(nibName: "FoodCartHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "foodCartHeaderId")
        collectionView.register(UINib(nibName: "FoodCartFooter", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "foodCartFooterId")
        
        collectionView.addSubview(noItemsInCardLabel)
        noItemsInCardLabel.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.addConstraintsWithFormat(format: "H:|[v0(\(collectionView.frame.width))]|", views: noItemsInCardLabel)
        collectionView.addConstraintsWithFormat(format: "V:|[v0(\(collectionView.frame.height))]|", views: noItemsInCardLabel)
        
        getDataForItemsInCart()
    }
    
    func getDataForItemsInCart() {
        if false {
            noItemsInCardLabel.isHidden = true
        }else{
            noItemsInCardLabel.isHidden = false
        }
    }

}

extension FoodCartVC:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCartCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == collectionView.numberOfSections - 1 {
            return CGSize(width: view.frame.width, height: 150)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
