//
//  CompanyDetailViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class CompanyDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var imagePicker = UIImagePickerController()
    var currCompany = CompanyTableViewController.choosedCompany
                                            
    @IBOutlet weak var comapnyLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func didTapCreate(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
    }
    }
    
   
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                comapnyLogo.image = image
                currCompany!.logo = image
                
            }
            picker.dismiss(animated: true, completion: nil)

        }
    
    
}

    

