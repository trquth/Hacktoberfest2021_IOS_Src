//
//  MenuBarCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/10/2021.
//

import UIKit

class MenuBarCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLbl.textColor = .white
        
    }

}
