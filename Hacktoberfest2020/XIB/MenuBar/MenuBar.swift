//
//  MenuBar.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/10/2021.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "menuBarCellId"
    let titles = ["Current", "Past"]
    
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    
    var homeController: OrdersVC!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.menuBarCollectionView.collectionViewLayout = flowLayout
        self.menuBarCollectionView.showsHorizontalScrollIndicator = false
        self.menuBarCollectionView.backgroundColor = .clear
        
        
        self.menuBarCollectionView.dataSource = self
        self.menuBarCollectionView.delegate = self
        self.menuBarCollectionView.register(UINib(nibName: "MenuBarCell", bundle: nil), forCellWithReuseIdentifier: cellId)

//        let selectedIndex = IndexPath(item: 0, section: 0)
//        menuBarCollectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .centeredHorizontally)
        
        setupHorizontalBar()
        
    }
    
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.titleLbl.text = titles[indexPath.row]
        if indexPath.item == 1 {
            cell.titleLbl.textColor = .white
        }
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        menuBarCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
       // horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
        print(scrollView.contentOffset.x / 2)
    }
    
}
