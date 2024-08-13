//
//  EntryListViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/12/24.
//

import UIKit

class EntryListViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        saveTask()
        return true
    }
    
    @IBAction func saveTask() {
        
    }
    
    
    
    

    
}
