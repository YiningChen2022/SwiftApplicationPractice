//
//  StockTableViewCell.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Company: UILabel!
    
    @IBOutlet weak var pricce: UILabel!
    
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
