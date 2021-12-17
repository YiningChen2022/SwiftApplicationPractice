//
//  CampuslifeTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/14/21.
//

import UIKit

class CampuslifeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageview.layer.cornerRadius = 25
        imageview.clipsToBounds = true
    }
    @IBOutlet weak var timefield: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var typefield: UILabel!
    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var titlefield: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
