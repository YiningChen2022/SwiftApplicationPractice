//
//  ViewPostListTableViewCell.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/9/21.
//

import UIKit

class ViewPostListTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var postimage: UIImageView!
    
    @IBOutlet weak var type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
