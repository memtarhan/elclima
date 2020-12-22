//
//  WorkflowAssembly.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation
import Swinject

class WorkflowAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(Workflow.self) { _ in
            WorkflowImpl()
        }.inObjectScope(.container) // Singleton
    }
}
