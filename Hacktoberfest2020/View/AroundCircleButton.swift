//
//  ArroundCircleButton.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import UIKit

class AroundCircleButton: UIButton {

    override func draw(_ rect: CGRect) {
        print("draw")
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    }

}
