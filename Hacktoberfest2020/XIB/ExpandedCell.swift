//
//  ExpandedCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit
import GMStepper

class ExpandedCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var stepper: GMStepper! {
        didSet {
            stepper.buttonsBackgroundColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
            stepper.labelBackgroundColor = .white
            stepper.labelTextColor = .black
            stepper.minimumValue = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.backgroundColor = UIColor(red: 240, green: 240, blue: 240, alpha: 255)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  configureCell(data: FoodItem) {
        titleLbl.text = data.name
        priceLbl.text = "$ \(data.cost)"
    }
    
}
