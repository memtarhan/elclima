//
//  HomeRouter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol HomeRouter: class {
    var view: HomeViewController? { get set }
    
    func navigateToNearby()
}

class HomeRouterImpl: HomeRouter {
    var view: HomeViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func navigateToNearby() {
        presentNavigationController(with: factory.nearby, on: view)
    }
}
