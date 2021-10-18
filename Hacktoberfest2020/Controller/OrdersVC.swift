//
//  OrdersVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 07/10/2021.
//

import UIKit

class OrdersVC: UIViewController {
    
    lazy var menuBar: MenuBar = {
        let menuBar = MenuBar()
        menuBar.homeController = self
        return menuBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        
        setupMenuBar()
    }
    
    private func setupMenuBar() {
        let redView = UIView()
        redView.backgroundColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.backgroundColor = UIColor(red: 139.0/255.0, green: 8.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)

        NSLayoutConstraint.init(item: menuBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menuBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menuBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true

        let guide = view.safeAreaLayoutGuide
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    
    }
    
    
    func scrollToMenuIndex(menuIndex: Int)  {
    }
    

}
