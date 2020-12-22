//
//  NearbyInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyInteractor: class {
    var selectedCityWoeid: Int? { get set }
    
    func retrieveCities(_ completionHandler: @escaping (Result < [CityModel], Error>) -> Void)
}

class NearbyInteractorImpl: NearbyInteractor {
    private let service: NearbyService
    private var workflow: Workflow
    
    var selectedCityWoeid: Int? {
        get { return workflow.selectedCityWoeid }
        set { workflow.selectedCityWoeid = newValue }
    }

    init(service: NearbyService, workflow: Workflow) {
        self.service = service
        self.workflow = workflow
    }
    
    func retrieveCities(_ completionHandler: @escaping (Result<[CityModel], Error>) -> Void) {
        completionHandler(.success(workflow.cities ?? []))
    }
}
