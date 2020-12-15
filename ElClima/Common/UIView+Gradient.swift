//
//  UIView+Gradient.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 15.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradientBackground() {
        let colorTop =  UIColor(red: 50 / 255.0, green: 127 / 255.0, blue: 226 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 49 / 255.0, green: 194 / 255.0, blue: 218 / 255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

@IBDesignable
class GradientBackgroundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradientBackground()
    }
}
