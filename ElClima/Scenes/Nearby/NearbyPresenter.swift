//
//  NearbyPresenter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyPresenter: class {
    var view: NearbyViewController? { get set }
    var interactor: NearbyInteractor? { get set }
    var router: NearbyRouter? { get set }
}

class NearbyPresenterImpl: NearbyPresenter {
    var view: NearbyViewController?
    var interactor: NearbyInteractor?
    var router: NearbyRouter?
}
