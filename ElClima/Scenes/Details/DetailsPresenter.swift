//
//  DetailsPresenter.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol DetailsPresenter: class {
    var view: DetailsViewController? { get set }
    var interactor: DetailsInteractor? { get set }
    var router: DetailsRouter? { get set }

    func present()
    func update(_ response: CityDetails)
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?

    func present() {
        interactor?.handleDetails()
    }

    func update(_ response: CityDetails) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        var days = [DetailsEntity.Weather.ViewModel]()
        response.weatherStates?.forEach({ state in
            days.append(DetailsEntity.Weather.ViewModel(name: state.name,
                                                        icon: URL(string: state.iconURL ?? ""),
                                                        date: formatter.string(from: state.date ?? Date()),
                                                        temperature: "\(state.temperature ?? 0) °C"))
        })

        let viewModel = DetailsEntity.Details.ViewModel(name: response.title ?? "Unknown citt",
                                                        type: response.type ?? "Unknown type",
                                                        timezone: response.timezone ?? "Unknown timezone",
                                                        days: days)

        view?.display(viewModel)
    }
}
