//
//  HomePresenter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol HomePresenter: class {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?
}
