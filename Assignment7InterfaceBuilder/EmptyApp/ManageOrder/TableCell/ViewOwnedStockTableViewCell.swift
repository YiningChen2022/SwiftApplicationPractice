//
//  ViewOwnedStockTableViewCell.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/9/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewOwnedStockTableViewCell: UITableViewCell {
    static let identifier="ownstocks"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var naem: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    
    @IBOutlet weak var trade: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
