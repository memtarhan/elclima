//
//  DetailsInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol DetailsInteractor: class {
}

class DetailsInteractorImpl: DetailsInteractor {
    
    private let service: DetailsService

    init(service: DetailsService) {
        self.service = service
    }
}
