//
//  HomeEntity.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

struct HomeEntity {
    struct Place {
        struct ViewModel {
            let name: String
            let distance: String
            let image: UIImage?
        }
    }
    
    struct City {
        struct ViewModel {
            let title: String
            let icon: URL?
            let weather: String
            let temperature: String
        }
    }
}
