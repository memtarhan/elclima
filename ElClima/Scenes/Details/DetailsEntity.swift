//
//  DetailsEntity.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

struct DetailsEntity {
    struct Details {
        struct ViewModel {
            let name: String
            let type: String
            let timezone: String
            let days: [Weather.ViewModel]
        }
    }

    struct Weather {
        struct ViewModel {
            let name: String?
            let icon: URL?
            let date: String?
            let temperature: String?
        }
    }
}
