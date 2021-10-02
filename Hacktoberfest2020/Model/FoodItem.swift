//
//  FoodItem.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 31/07/2021.
//

import Foundation

class FoodItem: NSObject {
    
    let cost: Double
    let foodCourtId: Int
    let foodCourtName: String
    let id: Int
    let name: String
    let restaurantId: Int
    let restaurantName: String
    let timeToPrepareInMinutes: Int
    let category: String
    var count = 0
    
    init(data: [String: AnyObject]) {
        cost = data["cost"] as? Double ?? 0
        foodCourtId = data["foodCourtId"] as? Int ?? 0
        foodCourtName = data["foodCourtName"] as? String ?? ""
        id = data["id"] as? Int ?? 0
        name = data["name"] as? String ?? ""
        restaurantId = data["restaurantId"] as? Int ?? 0
        timeToPrepareInMinutes = data["timeToPrepareInMinutes"] as? Int ?? 0
        category = data["category"] as? String ?? ""
        restaurantName = data["restaurantName"] as? String ?? ""
    }
}
