//
//  CustomButton.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/2/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var boarderThickness: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = boarderThickness
        }
    }
    @IBInspectable var boarderColor: UIColor=UIColor.black{
        didSet{
            self.layer.borderColor = boarderColor.cgColor
        }
    }
    @IBInspectable var boarderCorner: CGFloat = 0.0{
    didSet{
        self.layer.cornerRadius = boarderCorner
        
    }
}

    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
