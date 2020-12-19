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

    func display(_ viewModels: [HomeEntity.Place.ViewModel])
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!

    private var locationManager: CLLocationManager?
    private var location: CLLocation?
    private var region: MKCoordinateRegion?

    private var viewModels = [HomeEntity.Place.ViewModel]()

    private let cellReuseIdentifier = "Place"
    private let cellNibName = "PlaceTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didChangePlace(_ sender: Any) {
        guard let location = self.location,
              let region = self.region else { return }
        updateIndicator(true)
        presenter?.presentLocalSearch(for: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!, at: region, currentLocation: location)
    }

    @IBAction func didTapNearby(_ sender: Any) {
        presenter?.presentNearby()
    }

    private func setup() {
        updateIndicator(true)
        let cellNib = UINib(nibName: cellNibName, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.rowHeight = 64

        setLocationManager()
    }

    private func setLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }
    
    private func updateIndicator(_ animating: Bool) {
        indicatorView.isHidden = !animating
        if animating { indicatorView.startAnimating() }
        else { indicatorView.stopAnimating() }
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
    func display(_ viewModels: [HomeEntity.Place.ViewModel]) {
        self.viewModels = viewModels
        DispatchQueue.main.async {
            self.updateIndicator(false)
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? PlaceTableViewCell else { return UITableViewCell() }

        let viewModel = viewModels[indexPath.row]
        cell.nameLabel.text = viewModel.name
        cell.distanceLabel.text = viewModel.distance

        return cell
    }
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
        self.location = location
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        region = MKCoordinateRegion(center: location.coordinate, span: span)
        presenter?.presentLocalSearch(for: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!, at: region!, currentLocation: location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugLog(self, #function)
    }
}
