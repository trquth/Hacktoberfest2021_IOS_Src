//
//  MenuBar.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 16/10/2021.
//

import UIKit

class MenuTabBar: UIView, UICollectionViewDataSource,  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue:31)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    let tabs = ["Current", "Past"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuTabBarCell.self, forCellWithReuseIdentifier: cellId)
        
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuTabBarCell
        cell.titleLbl.text = tabs[indexPath.row]
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / CGFloat(tabs.count), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class MenuTabBarCell : BaseCell {
    
    let titleLbl : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Test"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    override var isHighlighted : Bool {
        didSet {
            titleLbl.textColor = isHighlighted == true ? .white : .lightGray
            titleLbl.font = isHighlighted == true ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 12)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            titleLbl.textColor = isSelected == true ? .white : .lightGray
            titleLbl.font = isSelected == true ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 12)
        }
    }
    
    override func setupViews()  {
        super.setupViews()
        
        self.backgroundColor = .blue
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLbl)
        
        titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
