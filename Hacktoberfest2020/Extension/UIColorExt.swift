//
//  UIColor.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import UIKit

extension UIColor {
    convenience init(red: Int = 0, green: Int = 0, blue: Int = 0, alpha: Int = 255){
        self.init(red: CGFloat(red) / 255.0,green: CGFloat(green) / 255.0, blue: CGFloat(blue)  / 255.0, alpha : CGFloat(alpha / 255))
    }
}
