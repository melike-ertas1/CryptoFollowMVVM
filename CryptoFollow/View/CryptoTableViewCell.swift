//
//  CryptoTableViewCell.swift
//  CryptoFollow
//
//  Created by melike ertaş on 13.12.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var priceText: UILabel!
    @IBOutlet var currencyText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
