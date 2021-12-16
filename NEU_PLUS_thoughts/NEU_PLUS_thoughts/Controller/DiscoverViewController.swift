//
//  DiscoverViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/13/21.
//

import UIKit
import AVFoundation
import Foundation
class DiscoverViewController: UIViewController {

    @IBOutlet weak var FleaiMAGE: UIImageView!
    
    @IBOutlet weak var compusimage: UIImageView!
    
    
    @IBOutlet weak var entimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        compusimage.layer.cornerRadius = 30
        compusimage.clipsToBounds = true
       
        
        FleaiMAGE.layer.cornerRadius = 30
        FleaiMAGE.clipsToBounds = true
        
        entimage.layer.cornerRadius = 30
        entimage.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

