
//  DiscoverViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/13/21.
//

import UIKit
import AVFoundation
import Foundation
class DiscoverViewController: UIViewController {

    @IBOutlet weak var HelathButton: UIButton!
    @IBOutlet weak var FleaiMAGE: UIImageView!
    
    @IBOutlet weak var compusimage: UIImageView!
    
    @IBOutlet weak var myneubutton: UIButton!
    
    @IBOutlet weak var entimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        compusimage.layer.cornerRadius = 30
        compusimage.clipsToBounds = true
       
        
        FleaiMAGE.layer.cornerRadius = 30
        FleaiMAGE.clipsToBounds = true
        
        entimage.layer.cornerRadius = 30
        entimage.clipsToBounds = true
        
        
        myneubutton.backgroundColor = .clear
        myneubutton.layer.cornerRadius = 15
        myneubutton.layer.borderWidth = 3
        myneubutton.layer.borderColor = UIColor.systemPink.cgColor
        
        
        HelathButton.backgroundColor = .clear
        HelathButton.layer.cornerRadius = 15
        HelathButton.layer.borderWidth = 3
        HelathButton.layer.borderColor = UIColor.systemPink.cgColor
        
        
    }
    
    
    @IBAction func didTapHealth(_ sender: UIButton) {
        if let url = URL(string: "https://www.northeastern.edu/uhcs/") {
            UIApplication.shared.open(url)
        }
    }
    
    

    @IBAction func didTapopen(_ sender: UIButton) {
        if let url = URL(string: "https://my.northeastern.edu/") {
            UIApplication.shared.open(url)
        }
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

