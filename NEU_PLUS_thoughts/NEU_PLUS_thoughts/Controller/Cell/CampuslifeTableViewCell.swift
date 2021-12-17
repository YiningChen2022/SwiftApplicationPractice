//
//  CampuslifeTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/14/21.
//

import UIKit

class CampuslifeTableViewCell: UITableViewCell {
    @IBOutlet weak var timefield: UILabel!
    @IBOutlet weak var campusimageview: UIImageView!
    @IBOutlet weak var typefield: UILabel!
    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var titlefield: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        campusimageview.layer.cornerRadius = 25
        campusimageview.clipsToBounds = true
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
