//
//  HomeInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol HomeInteractor: class {
    var presenter: HomePresenter? { get set }

    func handleCurrentCity(withLatitude latitude: Double, longitude: Double)
}

class HomeInteractorImpl: HomeInteractor {
    var presenter: HomePresenter?

    private let service: HomeService
    private var workflow: CurrentCityWorkflow

    init(service: HomeService, workflow: CurrentCityWorkflow) {
        self.service = service
        self.workflow = workflow
    }

    func handleCurrentCity(withLatitude latitude: Double, longitude: Double) {
        service.retrieveCurrentCity(withLatitude: latitude, longitude: longitude) { result in
            switch result {
            case let .success(cities):
                self.workflow.cities = cities
                guard let woeid = cities.first?.woeid else {
                    // TODO: Handle error
                    return
                }

                self.service.retrieveDetails(forWoeid: woeid) { detailsResult in
                    switch detailsResult {
                    case let .success(detailsData):
                        self.presenter?.update(detailsData)
                    case let .failure(detailsError):
                        debugLog(self, detailsError)
                    }
                }

            case .failure:
                break
            }
        }
    }
}
