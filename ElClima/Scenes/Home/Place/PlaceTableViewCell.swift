//
//  PlaceTableViewCell.swift
//  ElClima
//
//  Created by Mehmet Tarhan on 20.12.2020.
//  Copyright © 2020 memtarhan. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
