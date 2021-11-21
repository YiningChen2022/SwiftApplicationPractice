//
//  PlaceOrderTableViewCell.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class PlaceOrderTableViewCell: UITableViewCell {
    static let identifier="PlaceOrderTableViewSell"
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var QuantityField: UITextField!
    
    @IBOutlet weak var LastPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
