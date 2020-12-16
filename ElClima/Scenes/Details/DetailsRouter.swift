//
//  DetailsRouter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol DetailsRouter: class {
    var view: DetailsViewController? { get set }
}

class DetailsRouterImpl: DetailsRouter {
    var view: DetailsViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
