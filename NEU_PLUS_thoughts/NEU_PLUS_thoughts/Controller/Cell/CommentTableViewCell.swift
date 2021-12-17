//
//  CommentTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/16/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentuser: UIImageView!
    @IBOutlet weak var User: UILabel!
    
    @IBOutlet weak var commenttime: UILabel!
    
    @IBOutlet weak var commenttext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
