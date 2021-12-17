//
//  EntertainmentTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/15/21.
//

import UIKit

class EntertainmentTableViewCell: UITableViewCell {

    @IBOutlet weak var EntUser: UILabel!
    
    @IBOutlet weak var enttype: UILabel!
    
    @IBOutlet weak var entimageview: UIImageView!
    @IBOutlet weak var enttitle: UILabel!
    @IBOutlet weak var enttime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        entimageview.layer.cornerRadius = 25
        entimageview.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
