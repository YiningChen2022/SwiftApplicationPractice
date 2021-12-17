//
//  CreateNewPsotViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class CreateNewPsotViewController: UIViewController {

    @IBOutlet weak var backg: UIImageView!
    private var selectedHeaderImage: UIImage?
    var type="Campus Life"
    @IBOutlet weak var titleField: UITextField!
    var user:User?
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var postTextField: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        backg.layer.shadowColor = UIColor.black.cgColor
        backg.layer.shadowRadius = 3.0
        backg.layer.shadowOpacity = 1.0
        backg.layer.shadowOffset = CGSize(width: 4, height: 4)
        backg.layer.masksToBounds = false
        backg.layer.cornerRadius = 30
        backg.clipsToBounds = true
        postImage.isUserInteractionEnabled=true
        let tap = UITapGestureRecognizer(target: self, action:#selector(didTapHeader))
        postImage.addGestureRecognizer(tap)
        spinner.hidesWhenStopped=true
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        fetchProgileData(email:currentUserEmail)
        
        // Do any additional setup after loading the view.
    }
    //
    

    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            type = "Campus Life"
        }else if sender.selectedSegmentIndex == 1 {
            type = "Flea Market"
        }else if sender.selectedSegmentIndex == 2 {
            type = "Entertainment"
        }
    }
    
   
    @objc private func didTapHeader(){
        let picker=UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present (picker, animated: true)
        
        
    }
    private func fetchProgileData(email:String){
        DatabaseManager.shared.getUser(email: email){
            [weak self] user in
            guard let user = user else{
                return
            }
            self?.user = user
            
           
        }
    }
    

    @IBAction func didTapPosts(_ sender: Any) {
        spinner.startAnimating()
        guard let title = titleField.text, !title.trimmingCharacters(in:  .whitespaces).isEmpty,
              let body = postTextField.text,
              !body.trimmingCharacters(in: .whitespaces).isEmpty,
              let  headerImage=selectedHeaderImage
        ,let email = UserDefaults.standard.string(forKey: "email") else{
            let alert = UIAlertController(title:"Enter Post Details", message:"Please enter a title, body and select a image to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style:  .cancel, handler: nil))
            present(alert,animated: true)
            
            return
        }
        let postId = UUID().uuidString
        //upload header image
        StorageManager.shared.uploadBlogHeaderImage(email: email, image: headerImage, postid: postId){
            success in
            guard success else {
                return
            }
            StorageManager.shared.downLoadUrlForPostHeader(email: email, postid: postId){ [self]
                url in guard let headerUrl = url else {
                    print ("Failed to upload url for Header")
                    return
                }
        
        // insert of post into DB
              
                let post=BlogPost(identifier:postId, title: title, timestamp: Date().timeIntervalSince1970, headerImageUrl:headerUrl, text: body, type: self.type, postUser: self.user?.name, postUserEmail: self.user?.email)
                
                DatabaseManager.shared.insertBlogPost(
                    post:post, email:email){[ weak self]
                    posted in guard posted else {
                        print("Failed to post new Blog Article")
                        return
                    }
                    DispatchQueue.main.async {
                        let vc=self?.storyboard?.instantiateViewController(withIdentifier: "Home") as? TabBarViewController
                        vc!.modalPresentationStyle = .fullScreen
                        self?.present (vc!, animated:true)
                    }
                    }
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

