//
//  CustomerTableViewCell.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Symbol: UILabel!
    
    @IBOutlet weak var viewbutton: UIButton!
    @IBAction func didTapviewDetai(_ sender: UIButton) {
        
           
            
    }
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var hq: UILabel!
    @IBOutlet weak var CompanyLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
