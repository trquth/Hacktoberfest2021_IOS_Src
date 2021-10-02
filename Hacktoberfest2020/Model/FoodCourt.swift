//
//  File.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import Foundation

class  FoodCourt {
    let id: String
    let foodCourtName: String
    let address: String
    let city: String
    let openTime: String
    let closeTime: String
    let restaurant: [Restaurant]
    
    init(data: [String: AnyObject]) {
        id = data["id"] as? String ?? ""
        foodCourtName = data["foodCourtName"] as? String ?? ""
        address = data["address"] as? String ?? ""
        city = data["city"] as? String ?? ""
        openTime = data["openTime"] as? String ?? ""
        closeTime = data["closeTime"] as? String ?? ""
        //restaurant = Restaurant.getRestaurants(data: []) as? [Restaurant] ?? []
        restaurant = data["restaurant"] as? [Restaurant] ?? []
    }
}
