//
//  ProfileViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var UserName: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.myTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text=data.myTitle[indexPath.row]
   
        cell.imageView?.image=data.icons[indexPath.row]
        return cell
    }

 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UITableViewCell.self,
                                    forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        UserName.text=currentUserEmail
        
        // Do any additional setup after loading the view.
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
