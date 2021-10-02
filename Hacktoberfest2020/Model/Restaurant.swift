//
//  Restaurant.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import Foundation

class Restaurant {
    let id: String
    let fcId: String
    let name: String
    let iconName: String
    
    init(data: [String : AnyObject]) {
        id = data["id"] as? String ?? ""
        fcId = data["fcId"] as? String ?? ""
        name = data["name"] as? String ?? ""
        iconName = data["iconName"] as? String ?? ""
    }
    
    static func getRestaurants(data: [[String: AnyObject]]) -> [Restaurant] {
        var restaurants: [Restaurant] = []
        for item in data {
            restaurants.append(Restaurant(data: item))
        }
        return restaurants
    }
}
