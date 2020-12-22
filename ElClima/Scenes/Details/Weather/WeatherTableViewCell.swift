//
//  WeatherTableViewCell.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 22.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var model: DetailsEntity.Weather.ViewModel! {
        didSet {
            nameLabel.text = model.name
            dateLabel.text = model.date
            tempLabel.text = model.temperature
            iconImageView.kf.setImage(with: model.icon)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
