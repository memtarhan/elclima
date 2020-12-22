//
//  CurrentCityWorkflow.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation

protocol Workflow {
    var cities: [CityModel]? { get set }
    var selectedCityWoeid: Int? { get set }
}

class WorkflowImpl: Workflow {
    var cities: [CityModel]?
    var selectedCityWoeid: Int?
}
