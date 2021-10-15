//
//  MenuBar.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 15/10/2021.
//

import UIKit

class MenuBar: UIView,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "menuBarCellId"
    let titles = ["Current", "Past"]
    
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let flowLayout = UICollectionViewFlowLayout()
        self.menuBarCollectionView.backgroundColor = .clear
        
        self.menuBarCollectionView.dataSource = self
        self.menuBarCollectionView.delegate = self
        self.menuBarCollectionView.register(UINib(nibName: "MenuBarCell", bundle: nil), forCellWithReuseIdentifier: cellId)

        
        print("run")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        print(titles[indexPath.row])
        cell.titleLbl.text = titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    
}
