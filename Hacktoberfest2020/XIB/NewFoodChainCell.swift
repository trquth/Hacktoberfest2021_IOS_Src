//
//  NewFoodChainCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit

class NewFoodChainCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let vendorCellId = "vendorCellId"
    
    var foodCourt: FoodCourt! {
        didSet {
            titleLbl.text = foodCourt.foodCourtName
            collectionView.reloadData()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print(#function)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
       
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "VendorCell", bundle: nil), forCellWithReuseIdentifier: vendorCellId)
   
    }
    
    func configureCell(data: FoodCourt) {
        
        
    }
}

extension NewFoodChainCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(foodCourt.restaurant.count)
        return foodCourt.restaurant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: vendorCellId, for: indexPath) as! VendorCell
        cell.configureView(data: foodCourt.restaurant[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("inside indexPath \(indexPath)")
    }
}
