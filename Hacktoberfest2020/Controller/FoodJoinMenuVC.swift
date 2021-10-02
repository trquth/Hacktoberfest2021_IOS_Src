//
//  FoodJoinMenuVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import UIKit

struct CellData  {
    var opened: Bool = true
    var title: String
    var sectionData: [FoodItem]
}

class FoodJoinMenuVC: UITableViewController {
    
    private let expandedCellId = "expandedCellId"
    private let sectionHeaderId = "sectionHeaderId"
    private var foodMenuData : [CellData] = []
    
    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Food Menu"
        
        tableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: expandedCellId)
        tableView.register(UINib(nibName: "CustomizedFoodMenuHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: sectionHeaderId)
        
        getFooMenu()
    }
    
    func getFooMenu() {
        self.tableView.makeToastActivity(.center)
        foodMenuData = []
        foodMenuData.append(CellData(title: "Appetizer", sectionData: [
            FoodItem(data: ["cost" : 6.49, "foodCourtId": 1 ,"foodCourtName": "Crispy McNuggets","id":1, "name":"Crispy McNuggets", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
            FoodItem(data: ["cost" : 6.49, "foodCourtId": 1 ,"foodCourtName": "BBQ McNuggets","id":2, "name":"BBQ McNuggets", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
            FoodItem(data: ["cost" : 6.49, "foodCourtId": 1 ,"foodCourtName": "Mozzarella Stick","id":3, "name":"BBQ McNuggets", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject])
        ]))
        
        foodMenuData.append(CellData(title: "Burger", sectionData: [
            FoodItem(data: ["cost" : 1.99, "foodCourtId": 1 ,"foodCourtName": "Junior McChicken","id":4, "name":"Junior McChicken", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
            FoodItem(data: ["cost" : 1.99, "foodCourtId": 1 ,"foodCourtName": "Angus Grilled","id":5, "name":"Angus Grilled", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
            FoodItem(data: ["cost" : 1.99, "foodCourtId": 1 ,"foodCourtName": "Triple McChicken","id":6, "name":"Triple McChicken", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject])
        ]))
        
        foodMenuData.append(CellData(title: "Beverages", sectionData: [
            FoodItem(data: ["cost" : 6.49, "foodCourtId": 1 ,"foodCourtName": "Triple Thick Milkshake","id":7, "name":"Triple Thick Milkshake", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
            FoodItem(data: ["cost" : 1, "foodCourtId": 1 ,"foodCourtName": "Pepsi","id":8, "name":"Pepsi", "restaurantId":1,"timeToPrepareInMinutes": 1000,"category": "x","restaurantName":" " ] as [String: AnyObject]),
        ]))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            self.tableView.hideToastActivity()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return foodMenuData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let data = foodMenuData[section]
        return data.opened ? data.sectionData.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("item \(indexPath.item)")
        let cell = tableView.dequeueReusableCell(withIdentifier: expandedCellId, for: indexPath) as! ExpandedCell
        let data = foodMenuData[indexPath.section].sectionData[indexPath.row]
        cell.configureCell(data: data)
        cell.stepper.addTarget(self, action: #selector(updateCard), for: .valueChanged)
        return cell
    }
    
    @objc func updateCard(){
        var cardData = [String: String]()
        for section in 0..<foodMenuData.count {
            print("---------------------START SECTION-----------------------------")

            let rows = tableView.numberOfRows(inSection: section)
            for row in 0..<rows  {
                if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) as? ExpandedCell {
                    print("section \(section) row \(row) stepper value \(cell.stepper.value)")
                }
            }
            print("---------------------END SECTION-----------------------------")
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeaderId) as? CustomizedFoodMenuHeader else {
            return nil
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionHeaderTapped))
        header.tag = section
        header.addGestureRecognizer(tapGesture)
        
        var data = foodMenuData[section]
        header.configureHeader(data: data)
        
       return header
    }
    
    @objc func sectionHeaderTapped(sender: UITapGestureRecognizer){
        print("\(#function)")
        guard let section = sender.view?.tag else {
            return
        }
        if let  header = tableView.headerView(forSection: section) as? CustomizedFoodMenuHeader {
            let data = foodMenuData[section]
            foodMenuData[section].opened = !data.opened
            header.configureHeader(data: data)
            tableView.reloadSections(IndexSet(integer: section), with: .automatic)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }    
}
