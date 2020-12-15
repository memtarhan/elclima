//
//  ViewControllerFactory.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation
import Swinject

protocol ViewControllerFactory {
    var home: HomeViewController { get }
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var home: HomeViewController { assembler.resolver.resolve(HomeViewController.self)! }
}
