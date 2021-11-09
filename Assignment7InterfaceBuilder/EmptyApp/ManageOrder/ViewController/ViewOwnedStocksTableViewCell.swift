//
//  ViewOwnedStocksTableViewCell.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/9/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class ViewOwnedStocksTableViewCell: UITableViewCell {
    static let identifier="CustomeTableViewSell"
    
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Quantity: UILabel!
    @IBOutlet weak var StockName: UILabel!
    @IBOutlet weak var name: UILabel!
    private let myLabel:UILabel = {
        let label=UILabel()
        label.textColor = .black
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

}
