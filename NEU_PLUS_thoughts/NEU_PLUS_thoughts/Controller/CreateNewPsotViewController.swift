//
//  CreateNewPsotViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class CreateNewPsotViewController: UIViewController {

    private var selectedHeaderImage: UIImage?
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var postTextField: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.isUserInteractionEnabled=true
        let tap = UITapGestureRecognizer(target: self, action:#selector(didTapHeader))
        postImage.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    
   
    @objc private func didTapHeader(){
        let picker=UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present (picker, animated: true)
        
        
    }

    @IBAction func didTapPosts(_ sender: Any) {
        guard let title = titleField.text, !title.trimmingCharacters(in:  .whitespaces).isEmpty,
              let body = postTextField.text,
              !body.trimmingCharacters(in: .whitespaces).isEmpty,
              let  headerImage=selectedHeaderImage
        ,let email = UserDefaults.standard.string(forKey: "email") else{
            return
        }
        let postId = UUID().uuidString
        //upload header image
        StorageManager.shared.uploadBlogHeaderImage(email: email, image: headerImage, postid: postId){
            success in
            guard success else {
                return
            }
            StorageManager.shared.downLoadUrlForPostHeader(email: email, postid: postId){
                url in guard let headerUrl = url else {
                    return
                }
            
            
        
        
        // insert of post into DB
        
        let post=BlogPost(identifier:postId, title: title, timestamp: Date().timeIntervalSince1970, headerImageUrl:headerUrl, text: body, type: "")
                
            }
        }
    }
    
}
extension  CreateNewPsotViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else{
            return }
         selectedHeaderImage = image
            postImage.image = image
        }
        
    }

