//
//  DetailsViewController.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit
import Firebase

protocol DetailsViewController: class {
    var presenter: DetailsPresenter? { get set }

    func display(_ viewModel: DetailsEntity.Details.ViewModel)
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var timezoneLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    private let cellReuseIdentifier = "Weather"
    private let cellNibName = "WeatherTableViewCell"

    private var days = [DetailsEntity.Weather.ViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Analytics.logEvent("viewed_screen", parameters: [
            "name": nibName! as NSObject,
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    private func setup() {
        let cellNib = UINib(nibName: cellNibName, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.rowHeight = 120

        presenter?.present()
    }

    private func localize() {
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
    func display(_ viewModel: DetailsEntity.Details.ViewModel) {
        days = viewModel.days
        DispatchQueue.main.async {
            self.nameLabel.text = viewModel.name
            self.typeLabel.text = viewModel.type
            self.timezoneLabel.text = viewModel.timezone
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailsViewControllerImpl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? WeatherTableViewCell else { return UITableViewCell() }
        let day = days[indexPath.row]
        cell.model = day

        return cell
    }
}
