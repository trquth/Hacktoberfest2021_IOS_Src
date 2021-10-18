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

        title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        
        print("bound \(view.bounds)")
        print("frame \(view.frame)")
        let titleLbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLbl.text = "Home"
        titleLbl.textColor = .white
        //titleLbl.backgroundColor = .yellow
        navigationItem.titleView = titleLbl
        

        
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
