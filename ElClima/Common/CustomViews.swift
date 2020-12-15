//
//  CustomViews.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

@IBDesignable
class TabBarView: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }
}
