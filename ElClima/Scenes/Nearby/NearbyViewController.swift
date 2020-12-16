//
//  NearbyViewController.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyViewController: class {
    var presenter: NearbyPresenter? { get set }
}

class NearbyViewControllerImpl: UIViewController {
    var presenter: NearbyPresenter?

    @IBOutlet var tableView: UITableView!

    private let cellReuseIdentifier = "City"
    private let cellNibName = "CityTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @objc private func didTapNext(_ sender: UIButton) {
        presenter?.presentDetails()
    }

    private func setup() {
        navigationItem.backButtonTitle = ""
        
        let cellNib = UINib(nibName: cellNibName, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.rowHeight = 120
    }
}

// MARK: - NearbyViewController

extension NearbyViewControllerImpl: NearbyViewController {
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NearbyViewControllerImpl: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CityTableViewCell else { return UITableViewCell() }
        cell.nextButton.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
        return cell
    }
}
