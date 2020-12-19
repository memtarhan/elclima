//
//  HomeViewController.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

protocol HomeViewController: class {
    var presenter: HomePresenter? { get set }
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    private var locationManager: CLLocationManager?
    private var region: MKCoordinateRegion?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTapNearby(_ sender: Any) {
        presenter?.presentNearby()
    }

    private func setup() {
        setLocationManager()
    }

    private func setLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}

// MARK: - CLLocationManagerDelegate

extension HomeViewControllerImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager?.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        region = MKCoordinateRegion(center: location.coordinate, span: span)
        presenter?.presentLocalSearch(for: "city", at: region!)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugLog(self, #function)
    }
}
