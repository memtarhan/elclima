//
//  NearbyInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyInteractor: class {
    func retrieveCities(_ completionHandler: @escaping (Result < [CityModel], Error>) -> Void)
}

class NearbyInteractorImpl: NearbyInteractor {
    private let service: NearbyService
    private let workflow: CurrentCityWorkflow

    init(service: NearbyService, workflow: CurrentCityWorkflow) {
        self.service = service
        self.workflow = workflow
    }
    
    func retrieveCities(_ completionHandler: @escaping (Result<[CityModel], Error>) -> Void) {
        completionHandler(.success(workflow.cities ?? []))
    }
}
