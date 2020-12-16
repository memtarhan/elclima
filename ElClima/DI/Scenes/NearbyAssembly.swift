//
//  NearbyAssembly.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Swinject
import UIKit

class NearbyAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NearbyViewController.self) { r in
            let viewController = NearbyViewControllerImpl(nibName: "NearbyViewController", bundle: nil)
            let presenter = r.resolve(NearbyPresenter.self)!
            let interactor = r.resolve(NearbyInteractor.self)!
            let router = r.resolve(NearbyRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(NearbyPresenter.self) { _ in
            NearbyPresenterImpl()
        }

        container.register(NearbyInteractor.self) { r in
            NearbyInteractorImpl(service: r.resolve(NearbyService.self)!)
        }

        container.register(NearbyRouter.self) { r in
            NearbyRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
        
        container.register(NearbyService.self) { r in
            NearbyServiceImpl()
        }
    }
}
