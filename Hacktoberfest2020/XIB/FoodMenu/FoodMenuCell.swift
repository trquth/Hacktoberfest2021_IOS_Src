//
//  FoodMenuCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/09/2021.
//

import UIKit
import GMStepper
 
class FoodMenuCell: UITableViewCell {
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodPriceLbl: UILabel!
    
    let stepper: GMStepper = {
        let stepper = GMStepper()
        stepper.labelFont = UIFont.systemFont(ofSize: 16)
        stepper.autorepeat = false
        stepper.maximumValue = 20
        stepper.buttonsBackgroundColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        stepper.labelBackgroundColor = .white
        stepper.labelTextColor = .black
        stepper.limitHitAnimationColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        return stepper
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodNameLbl.font = .boldSystemFont(ofSize: 16)
        foodPriceLbl.font = .systemFont(ofSize: 14)
        
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(foodNameLbl)
        stackView.addArrangedSubview(foodPriceLbl)
        stackView.spacing = 5
        
        addSubview(stackView)
        addSubview(stepper)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1,  constant: 0 ).isActive = true
        NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1,  constant: 10 ).isActive = true
       
        NSLayoutConstraint.init(item: stepper, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: stepper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint.init(item: stepper, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 110).isActive = true
        NSLayoutConstraint.init(item: stepper, attribute: .trailing , relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint.init(item: stepper, attribute: .leading , relatedBy: .equal, toItem: stackView, attribute: .trailing, multiplier: 1, constant: 10).isActive = true
    }
    
    


    
}
