//
//  Colors.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

extension UIColor {
    open class var blueGradientBottom: UIColor? {
        return UIColor(hex: "31C2DA")
    }

    open class var blueGradientTop: UIColor? {
        return UIColor(hex: "31C2DA")
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000FF) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
