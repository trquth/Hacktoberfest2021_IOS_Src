//
//  FoodChainViewCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit

class FoodChainViewCell: UICollectionViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    
    var image : UIImage! {
        didSet{
            restaurantImage.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.restaurantImage.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 218, green: 208, blue: 194)
       
    }

}
