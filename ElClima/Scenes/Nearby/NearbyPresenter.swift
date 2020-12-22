//
//  NearbyPresenter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import MapKit
import UIKit

protocol NearbyPresenter: class {
    var view: NearbyViewController? { get set }
    var interactor: NearbyInteractor? { get set }
    var router: NearbyRouter? { get set }

    func present()
    func presentDetails()
}

class NearbyPresenterImpl: NearbyPresenter {
    var view: NearbyViewController?
    var interactor: NearbyInteractor?
    var router: NearbyRouter?

    func present() {
        interactor?.retrieveCities({ [self] result in
            switch result {
            case let .success(cities):
                let viewModels = cities.map { (city) -> NearbyEntity.City.ViewModel in
                    let distanceFormatter = MKDistanceFormatter()
                    distanceFormatter.unitStyle = .abbreviated
                    let distanceString = distanceFormatter.string(fromDistance: CLLocationDistance(city.distance ?? 0))

                    return NearbyEntity.City.ViewModel(name: city.title ?? "Unknown city",
                                                       type: city.type,
                                                       distance: distanceString)
                }
                view?.display(viewModels)

            case .failure:
                router?.dismiss()
            }
        })
    }

    func presentDetails() {
        router?.navigateToDetails()
    }
}
