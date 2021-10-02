//
//  CustomizedFoodMenuHeader.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit

class CustomizedFoodMenuHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var upDownBtn: UIButton!
    
    var touchCallback: (() ->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        upDownBtn.imageView?.tintColor = .black
        upDownBtn.isEnabled = false
        
    }
    
    func configureHeader(data: CellData) {
        titleLbl.text = data.title
        var image = UIImage(named: "up_arrow")?.withRenderingMode(.alwaysTemplate)

        if data.opened == false {
          image = UIImage(named: "down_arrow")?.withRenderingMode(.alwaysTemplate)
        }
        upDownBtn.setImage(image, for: .normal)
        upDownBtn.imageView?.tintColor = .black
        
    }
}
