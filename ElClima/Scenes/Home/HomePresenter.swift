//
//  HomePresenter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import MapKit
import UIKit

protocol HomePresenter: class {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }

    func presentNearby()
    func presentLocalSearch(for query: String, at region: MKCoordinateRegion)
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?

    func presentNearby() {
        router?.navigateToNearby()
    }

    func presentLocalSearch(for query: String, at region: MKCoordinateRegion) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard error == nil else {
                // TODO: Present alert
                debugLog(self, "MKLocalSearch error: \(error!)")
                return
            }
            guard let response = response else { return }
            debugLog(self, "MKLocalSearch response: \(response)")
        }
    }
}
