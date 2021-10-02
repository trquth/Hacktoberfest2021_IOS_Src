//
//  FoodMenuSectionHeader.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 27/09/2021.
//

import UIKit

class FoodMenuSectionHeader: UITableViewCell {

    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var upDownBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        categoryNameLbl.font = .boldSystemFont(ofSize: 18)
    }
    
}
