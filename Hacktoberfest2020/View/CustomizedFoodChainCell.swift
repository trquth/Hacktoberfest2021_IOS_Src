//
//  CustomizedFoodChainCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit

class CustomizedFoodChainCell: UICollectionViewCell {
    
    private let vendorCellId = "vendorCellId"
    var foodCourt: FoodCourt! {
        didSet {
            vendorCollectionView.reloadData()
        }
    }
    
    
    lazy var vendorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "VendorCell", bundle: nil), forCellWithReuseIdentifier: vendorCellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(vendorCollectionView)
        vendorCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vendorCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            vendorCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            vendorCollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            vendorCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CustomizedFoodChainCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
