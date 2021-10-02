//
//  FoodMenuVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 26/09/2021.
//

import UIKit
import SwiftyJSON
import BBBadgeBarButtonItem

struct FoodMenutem {
    var id: Int;
    var foodName: String;
    var price: Double
}

struct FoodMenuCellData {
    var opened: Bool
    var title: String
    var sectionData: [FoodMenutem]
}
class FoodMenuVC: UIViewController {
    
    var restaurant: [String:Int] =  ["id":1]
    
        
    var data: [FoodMenuCellData] = []


    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    var cartItemsCount: String {
        get {
            var count: Int = 0
            if let currentCart = appDelegate.carItems["1"] {
                for item in currentCart {
                    count += Int(item.value)!
                }
            }
            return "\(count)"
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        
        title = "Food Menu"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FoodMenuCell", bundle: nil), forCellReuseIdentifier: "foodMenuCellId")
        tableView.register(UINib(nibName: "FoodMenuSectionHeader", bundle: nil), forCellReuseIdentifier: "foodMenuSectionHeaderId")
        
        getData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(#function)
        print(appDelegate.carItems)
        
        setCartIconBadge(cartItemsCount)
    }
    
    func setCartIconBadge(_ value: String = "") {
        let cartButton = UIButton()
        cartButton.setImage(UIImage(named: "cart"), for: .normal)
        let item = BBBadgeBarButtonItem(customUIButton: cartButton)
        item?.badgeValue = value
        self.navigationItem.rightBarButtonItem = item
    }
    
    func getData() {
        self.tableView.makeToastActivity(.center)
        if let path = Bundle.main.path(forResource: "foodmenu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonResult = try JSON(data: data)
                jsonResult["menu"].arrayValue.forEach{
                    item in
                    var menu: [FoodMenutem] = []
                    item["food"].arrayValue.forEach{
                        item in
                        var foodItem = FoodMenutem(id:item["id"].intValue , foodName: item["foodName"].stringValue, price: item["price"].doubleValue)
                        menu.append(foodItem)
                    }
                    self.data.append(FoodMenuCellData(opened: true, title: item["category"].stringValue , sectionData: menu))
                }
                
            } catch let error {
                print("parse error 👿👿👿 \(error.localizedDescription)")
            }
        }
        self.tableView.hideToastActivity()
    }
}

extension FoodMenuVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened {
            return data[section].sectionData.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodMenuSectionHeaderId", for: indexPath) as! FoodMenuSectionHeader
            let item = data[indexPath.section]
            cell.categoryNameLbl.text = item.title
            if item.opened {
                let image = UIImage(named: "up_arrow")?.withRenderingMode(.alwaysTemplate)
                cell.upDownBtn.setImage(image, for: .normal)
                cell.upDownBtn.imageView?.tintColor = .black
            }else{
                let image = UIImage(named: "down_arrow")?.withRenderingMode(.alwaysTemplate)
                cell.upDownBtn.setImage(image, for: .normal)
                cell.upDownBtn.imageView?.tintColor = .black
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodMenuCellId", for: indexPath) as! FoodMenuCell
            let item = data[indexPath.section].sectionData[indexPath.item - 1]
            cell.foodNameLbl.text = item.foodName
            cell.foodPriceLbl.text = "$ \(item.price)"
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
            cell.stepper.addTarget(self, action: #selector(cartUpdated), for: .valueChanged)

            return cell
        }
    }
    
    @objc func cartUpdated(){
        var cartData = [String: String]()
        for section in 0..<data.count {
            let rows = tableView.numberOfRows(inSection: section)
            for row in 0..<rows {
                if let cell =  tableView.cellForRow(at: IndexPath(row: row, section: section)) as? FoodMenuCell {
                    let item = data[section].sectionData[row - 1]
                    if cell.stepper.value > 0 {
                        cartData["\(item.id)"] = "\(Int(cell.stepper.value))"
                    }else{
                        cartData.removeValue(forKey: "\(item.id)")
                    }
                }
            }
        }
        print("cart 🛒🛒🛒 \(cartData)")
        guard let id = restaurant["id"] else {
           return
        }
       
        appDelegate.carItems[String(id)] = cartData
        setCartIconBadge(cartItemsCount)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 44
        }
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if data[section].opened {
            data[section].opened = false
            handleOpening(indexPath: indexPath, upOrDown: "up_arrow")
        }else{
            data[section].opened = true
            handleOpening(indexPath: indexPath, upOrDown: "down_arrow")
        }
    }
    
    func handleOpening(indexPath: IndexPath, upOrDown: String) {
        let sections = IndexSet(integer: indexPath.section)
        if let cell = tableView.cellForRow(at: indexPath) as? FoodMenuSectionHeader {
            cell.upDownBtn.setImage(UIImage(named: upOrDown), for: .normal)
            tableView.reloadSections(sections, with: .none)
        }
        
    }
}
