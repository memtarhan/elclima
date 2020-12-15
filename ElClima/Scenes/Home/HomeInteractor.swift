//
//  HomeInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol HomeInteractor: class {
}

class HomeInteractorImpl: HomeInteractor {
    
    private let service: HomeService

    init(service: HomeService) {
        self.service = service
    }
}
