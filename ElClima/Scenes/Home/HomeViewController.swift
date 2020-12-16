//
//  HomeViewController.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol HomeViewController: class {
    var presenter: HomePresenter? { get set }
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    @IBAction func didTapNearby(_ sender: Any) {
        presenter?.presentNearby()
    }

    private func setup() {
    }

    private func localize() {
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}
