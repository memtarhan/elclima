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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }
    
    private func setup() {
    }
    
    private func localize() {
    }
}

// MARK: - NearbyViewController

extension NearbyViewControllerImpl: NearbyViewController {
}

