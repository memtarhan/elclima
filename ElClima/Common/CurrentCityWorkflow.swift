//
//  CurrentCityWorkflow.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation

protocol CurrentCityWorkflow {
    var cities: [CityModel]? { get set }
}

class CurrentCityWorkflowImpl: CurrentCityWorkflow {
    var cities: [CityModel]?
}
