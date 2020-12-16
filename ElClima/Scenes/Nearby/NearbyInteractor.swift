//
//  NearbyInteractor.swift
//  ElClima
//
//  Created Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

protocol NearbyInteractor: class {
}

class NearbyInteractorImpl: NearbyInteractor {
    
    private let service: NearbyService

    init(service: NearbyService) {
        self.service = service
    }
}
