//
//  CityModel.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation

struct CityModel {
    let title: String?
    let woeid: Int?
    let type: String?
    let distance: Int?
    
    init(_ data: [String: Any]) {
        title = data["title"] as? String
        woeid = data["woeid"] as? Int
        type = data["location_type"] as? String
        distance = data["distance"] as? Int
    }
}
