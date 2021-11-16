//
//  ViewOwnedStockTableViewCell.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class ViewOwnedStockTableViewCell: UITableViewCell {
    static let identifier="ownstocks"
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var naem: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    
    @IBOutlet weak var trade: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
