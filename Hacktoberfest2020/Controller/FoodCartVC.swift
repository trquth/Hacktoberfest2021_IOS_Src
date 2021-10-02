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

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Your Cart"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FoodCartCell", bundle: nil), forCellWithReuseIdentifier: "foodCartCellId")
    }
    


}

extension FoodCartVC:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCartCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
}
