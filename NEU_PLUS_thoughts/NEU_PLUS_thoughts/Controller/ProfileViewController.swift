//
//  ProfileViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var backg: UIImageView!
    
    var currentEmail:String?
    @IBOutlet weak var Useremail: UILabel!
    private var user:User?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.myTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        cell.textLabel?.text=data.myTitle[indexPath.row]
       
        cell.imageView?.image=data.icons[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if data.myTitle[indexPath.row]=="Posts"{
            /*DispatchQueue.main.async {
                let vc=self.storyboard?.instantiateViewController(withIdentifier: "navigationController") as? NavigationViewController
                //vc!.title=self.posts[indexPath.row].title
                vc!.modalPresentationStyle = .fullScreen
                self.present (vc!, animated:true)
             
            }*/
        }else if data.myTitle[indexPath.row]=="Settings"{
            print("click settings")
        }else if data.myTitle[indexPath.row]=="Friends"{
            print("click Friends")}
       
        
    }

    @IBAction func didClickexplore(_ sender: Any) {
        
        
    }
    
    

    override func viewDidLoad() {
      
        super.viewDidLoad()
        //tableview.register(UITableViewCell.self,
          //                          forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        profileImage.layer.cornerRadius = 30
        profileImage.clipsToBounds = true
        backg.layer.cornerRadius=30
        backg.clipsToBounds = true
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        currentEmail=currentUserEmail
        Useremail.text=currentUserEmail
        fetchProgileData(email: currentUserEmail)
        profileImage.isUserInteractionEnabled=true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfilePhoto))
        profileImage.addGestureRecognizer(tap)
        if let ref=user?.profulePictureRef{
            StorageManager.shared.downLoadUrlForPorfilePic(path: ref){
                url in
                guard let url=url else {
                    return
                }
                let task = URLSession.shared.dataTask(with: url){
                    data, _, _ in guard let data=data else{
                        return
                    }
                    DispatchQueue.main.async {
                        self.profileImage.image=UIImage(data
                                                   :data )
                    }
                }
                task.resume()
            }
            
            
        }
        
        //UserName.text=currentUserEmail
        
        // Do any additional setup after loading the view.
    }
    public func fetchPicture(profulePictureRef: String){
        StorageManager.shared.downLoadUrlForPorfilePic(path: profulePictureRef){
            url in
            guard let url=url else {
                return
            }
            let task = URLSession.shared.dataTask(with: url){
                data, _, _ in guard let data=data else{
                    return
                }
                DispatchQueue.main.async {
                    self.profileImage.image=UIImage(data
                                               :data )
                }
            }
            task.resume()
        }
        
        
    }
    
    @objc private func didTapProfilePhoto(){
        guard let myEmail = UserDefaults.standard.string(forKey: "email"),myEmail == currentEmail else{
            return
        }
   
        let picker  = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated: true)
        
    }
    private func fetchProgileData(email:String){
        DatabaseManager.shared.getUser(email: email){
            [weak self] user in
            guard let user = user else{
                return
            }
            self?.user = user
            
            DispatchQueue.main.async {
               self!.UserName.text=user.name
                self!.fetchPicture(profulePictureRef: user.profulePictureRef ?? "")
            }
          
        }
    }
    

    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func didTapSignOut(_ sender: UIBarButtonItem) {
        let sheet = UIAlertController(title: "Sign Out", message: nil,preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title:"cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title:"Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut{
                [ weak self]
               
                success in if success{
                    DispatchQueue.main.async {
                        
                        UserDefaults.standard.set(nil, forKey:"email")
                        UserDefaults.standard.set(nil, forKey:"name")
                        let vc=self?.storyboard?.instantiateViewController(withIdentifier: "Welcome") as? ViewController
                        vc!.modalPresentationStyle = .fullScreen
                        self?.present (vc!, animated:true,completion:nil)
                    }
                }
            }
            
        }))
        present(sheet, animated: true)
        
      
    }
}

extension ProfileViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else{
            return
        }
        StorageManager.shared.uploadUserProfilePicture(email: currentEmail!, image: image){[weak self]
            success in
            guard let strongSelf = self else{
                return
            }
            if success {
                DatabaseManager.shared.updateProfilePhoto(email:strongSelf .currentEmail!){ updated in
                    guard updated else {
                        return
                    }
                    DispatchQueue.main.async {
                        strongSelf.fetchProgileData(email: strongSelf.currentEmail!)
                    }
                }
            }
            
        }
    }
}
