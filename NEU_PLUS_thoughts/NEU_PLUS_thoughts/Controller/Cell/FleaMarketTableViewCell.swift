//
//  FleaMarketTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/15/21.
//

import UIKit

class FleaMarketTableViewCell: UITableViewCell {

    @IBOutlet weak var fleauser: UILabel!
    
    @IBOutlet weak var fleaType: UILabel!
    @IBOutlet weak var fleaimage: UIImageView!
    @IBOutlet weak var FleaTitle: UILabel!
    
    @IBOutlet weak var fleaTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fleaimage.layer.cornerRadius = 25
        fleaimage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
