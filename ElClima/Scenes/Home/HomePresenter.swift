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

    func present()
    func presentNearby()
    func presentLocalSearch(for query: String, at region: MKCoordinateRegion, currentLocation location: CLLocation)

    func update(_ response: CityDetailsResponse)
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?

    func present() {
    }

    func presentNearby() {
        router?.navigateToNearby()
    }

    func presentLocalSearch(for query: String, at region: MKCoordinateRegion, currentLocation location: CLLocation) {
        interactor?.handleCurrentCity(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

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
            let viewModels = response.mapItems.map { (mapItem) -> HomeEntity.Place.ViewModel in
                debugLog(self, "Place name: \(mapItem.name!)")
                let placemarkLocation = CLLocation(latitude: mapItem.placemark.coordinate.latitude, longitude: mapItem.placemark.coordinate.longitude)
                let distance = location.distance(from: placemarkLocation)
                let distanceFormatter = MKDistanceFormatter()
                distanceFormatter.unitStyle = .abbreviated
                let distanceString = distanceFormatter.string(fromDistance: distance)
                debugLog(self, "Place distance: \(distanceString)")
                let image = UIImage(named: query)

                let viewModel = HomeEntity.Place.ViewModel(name: mapItem.name!, distance: distanceString, image: image)
                return viewModel
            }

            self.view?.display(viewModels)
        }
    }

    func update(_ response: CityDetailsResponse) {
        debugLog(self, response)
        let iconURL = URL(string: response.weatherStates?.first?.iconURL ?? "")
        let temperature = Int(response.weatherStates?.first?.temperature ?? 0)
        let viewModel = HomeEntity.City.ViewModel(title: response.title ?? "Unknown",
                                                  icon: iconURL,
                                                  weather: response.weatherStates?.first?.weatherName ?? "Unknown",
                                                  temperature: "\(temperature)")

        view?.display(viewModel)
    }
}
