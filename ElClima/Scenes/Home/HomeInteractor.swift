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

    init(service: HomeService) {
        self.service = service
    }

    func handleCurrentCity(withLatitude latitude: Double, longitude: Double) {
        service.retrieveCurrentCity(withLatitude: latitude, longitude: longitude) { result in
            switch result {
            case let .success(response):
                self.presenter?.update(response)
            case .failure:
                break
            }
        }
    }
}
