//
//  FoodCartCell.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 02/10/2021.
//

import UIKit

class FoodCartCell: UICollectionViewCell {
    
    let quantity: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "11"
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let itemName: UILabel = {
        let label = UILabel()
        label.text = "Junior Chicken"
        label.textColor = .black
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "$5.00"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.backgroundColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        stepper.tintColor = .white
        stepper.maximumValue = 20
        stepper.minimumValue = 0
        stepper.layer.borderColor = UIColor.white.cgColor
        stepper.layer.borderWidth = 1
        return stepper
    }()
    
    let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "$25.00"
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        addSubview(itemName)
        itemName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(totalAmountLabel)
        totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(stepper)
        stackView.addArrangedSubview(quantity)
        
        
        addSubview(stackView)
        
        quantity.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: stepper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        
        NSLayoutConstraint.init(item: quantity, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint.init(item: quantity, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true

        NSLayoutConstraint.init(item: stackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
        NSLayoutConstraint.init(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint.init(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
    
        NSLayoutConstraint.init(item: itemName, attribute: .centerY, relatedBy: .equal, toItem: stackView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: itemName, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        
        NSLayoutConstraint.init(item: amountLabel, attribute: .top, relatedBy: .equal, toItem: itemName, attribute: .top, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint.init(item: amountLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        
        NSLayoutConstraint.init(item: totalAmountLabel, attribute: .bottom, relatedBy: .equal, toItem: divider, attribute: .bottom, multiplier: 1, constant:-10).isActive = true
        NSLayoutConstraint.init(item: totalAmountLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        
        NSLayoutConstraint.init(item: divider, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint.init(item: divider, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: divider, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: divider, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    
    
}
