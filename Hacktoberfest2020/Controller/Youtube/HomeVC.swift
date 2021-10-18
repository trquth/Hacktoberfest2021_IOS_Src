//
//  HomeVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/10/2021.
//

import UIKit

class HomeVC: UIViewController {

    lazy var menuBar: MenuTabBar = {
        let menuBar = MenuTabBar()
        return menuBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuBar()
    }
    

    func setupMenuBar() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
