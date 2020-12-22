//
//  DetailsInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol DetailsInteractor: class {
    var presenter: DetailsPresenter? { get set }
    func handleDetails()
}

class DetailsInteractorImpl: DetailsInteractor {
    var presenter: DetailsPresenter?

    private let service: DetailsService
    private let workflow: Workflow

    init(service: DetailsService, workflow: Workflow) {
        self.service = service
        self.workflow = workflow
    }

    func handleDetails() {
        guard let woeid = workflow.selectedCityWoeid else { return }
        service.retrieve(forWoeid: woeid) { result in
            switch result {
            case let .success(details):
                self.presenter?.update(details)
            case .failure:
                break
            }
        }
    }
}
