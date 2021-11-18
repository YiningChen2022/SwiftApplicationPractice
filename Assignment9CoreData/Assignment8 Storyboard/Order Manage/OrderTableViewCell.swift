//
//  OrderTableViewCell.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var quantities: UILabel!
    @IBOutlet weak var stocks: UILabel!
    @IBOutlet weak var id: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
