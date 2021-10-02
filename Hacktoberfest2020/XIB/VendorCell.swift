//
//  VendorCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 23/07/2021.
//

import UIKit

class VendorCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .blue
            imageView.layer.cornerRadius = 12
            imageView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func  configureView(data: Restaurant)  {
        imageView.image = UIImage(named: data.iconName)
        imageView.layer.cornerRadius = 5
    }
}
