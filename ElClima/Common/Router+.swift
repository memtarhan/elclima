//
//  Router+.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

func presentNavigationController<T, E>(with view: T, on source: E?) {
    guard let source = source as? UIViewController,
          let destination = view as? UIViewController else { return }
    DispatchQueue.main.async {
        let navigationController = UINavigationController(rootViewController: destination)
        navigationController.modalPresentationStyle = .popover
        navigationController.modalTransitionStyle = .coverVertical
        source.present(navigationController, animated: true, completion: nil)
    }
}

func push<T, E>(_ view: T, from source: E?) {
    guard let source = source as? UIViewController,
          let destination = view as? UIViewController else { return }
    DispatchQueue.main.async {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
