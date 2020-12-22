//
//  CustomViews.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 16.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bounds
        blurView.autoresizingMask = .flexibleWidth
        insertSubview(blurView, at: 0)
    }
}
