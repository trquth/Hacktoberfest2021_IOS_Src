//
//  ClientHomeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import UIKit

class ClientHomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let foodBrandLogos = ["KFC","logo-58","Mcdonalds","Pizza Pizza","Starbuck","Subway","Taco Bell", "Tim Hortons","Wendys"]
    var foodCourts : [FoodCourt] = []
    private let foodCourtCell = "foodChainCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Food Curts"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewFlowLayout = layout
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
        collectionView.register(UINib(nibName: "NewFoodChainCell", bundle: nil), forCellWithReuseIdentifier: foodCourtCell)
        
        collectionView.isPagingEnabled = true
        
        foodCourts = generateFoodCurts()
    }
    
    private func generateFoodCurts() -> [FoodCourt] {
        var foodCourtArray: [FoodCourt] = []
        for (index, element) in ["Devonshire","Tecumseh","University Cafeteria","St. Clair Street"].enumerated() {
            var restaurants : [Restaurant] = []
            var foodCourtObject : [String: AnyObject] = ["id": String(describing: index),
                                                           "foodCourtName": element,
                                                           "address": "62/20 Dinh Bo Linh, phuong 26, Binh Thanh, HCM",
                                                           "city":"Ho Chi Minh",
                                                           "openTime": "7am",
            "closeTime":"20pm"] as [String: AnyObject]
            
            
            for (index, restaurant) in foodBrandLogos.enumerated() {
                let restaurant  = Restaurant(data:  [
                    "id": String(describing: index),
                    "fcId": String(describing: index),
                    "name": restaurant,
                    "iconName": restaurant
                    ] as [String: AnyObject])
                restaurants.append(restaurant)
            }
            foodCourtObject["restaurant"] = restaurants as AnyObject
            var foodCourtData : FoodCourt = FoodCourt(data: foodCourtObject)
            foodCourtArray.append(foodCourtData)
        }
        dump(foodCourtArray)
        return foodCourtArray
    }

}

extension ClientHomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 1
        return foodCourts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: foodCourtCell, for: indexPath) as! NewFoodChainCell
        //cell.configureCell(data: foodCourts[indexPath.row])
        cell.foodCourt = foodCourts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("outside indexPath \(index)")
    }
}
