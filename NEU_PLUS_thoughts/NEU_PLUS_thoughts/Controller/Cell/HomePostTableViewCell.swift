//
//  HomePostTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/10/21.
//

import UIKit

class HomePostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleFirld: UILabel!
    @IBOutlet weak var postimage: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var timefirld: UILabel!
    
    @IBOutlet weak var userfield: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        postimage.layer.cornerRadius = 25
        postimage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
