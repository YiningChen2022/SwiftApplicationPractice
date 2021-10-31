//
//  ViewCustomerUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class ViewCustomerUIView: UIView {
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func closeWindow(sender : UIButton) {
        let parentWin:UIView = sender.superview!;
        parentWin.removeFromSuperview()
   }

}
