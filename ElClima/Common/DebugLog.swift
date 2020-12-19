//
//  DebugLog.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 20.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import Foundation

func debugLog(_ tag: AnyObject, _ items: Any...) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM HH:mm:ss.SSSS"
    let currentDate = dateFormatter.string(from: Date())
    #if DEBUG
        var list: [Any] = []
        let logInfo = currentDate + " " + String(describing: tag)
        list.append(logInfo)
        list.append(contentsOf: items)
        print(list, separator: " ", terminator: "\n")
    #endif
}
