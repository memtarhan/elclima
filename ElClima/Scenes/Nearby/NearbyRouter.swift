//
//  NearbyRouter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyRouter: class {
    var view: NearbyViewController? { get set }
    
    func navigateToDetails()
}

class NearbyRouterImpl: NearbyRouter {
    var view: NearbyViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func navigateToDetails() {
        push(factory.details, from: view)
    }
}
