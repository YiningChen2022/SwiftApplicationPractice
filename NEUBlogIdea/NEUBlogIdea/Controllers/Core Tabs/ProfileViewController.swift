//
//  ProfileViewController.swift
//  NEUBlogIdea
//
//  Created by Yining Chen on 10/4/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
 


 
    //full name
    
    
    //email
    
    //List of posts
    
    private let tableView: UITableView={
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    let currentEmail : String
    
    init(currentEamil: String){
        self.currentEmail = currentEamil
        super.init(nibName:nil, bundle:nil)
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem=UIBarButtonItem(
            title:"Sign out",
            style: .done,
            target: self,
            action: #selector(didTapSignOut)
        )
        setUpSignOutButton()
        setUpTable()
        title = currentEmail
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        tableView.frame=view.bounds
        
    }
    private func setUpSignOutButton(){
        
    }
    private func setUpTable(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableHeader()
    }
    private func setUpTableHeader(){
        let headerView = UIView(frame:CGRect(x:0,y:0,width:view.width, height: view.width))
        headerView.backgroundColor = .systemBlue
        headerView.clipsToBounds=true
        tableView.tableHeaderView=headerView
        
        
        //Profile Photo
        let profilePhoto = UIImageView(image:UIImage(systemName:"person"))
        profilePhoto.tintColor = .white
        profilePhoto.contentMode = .scaleAspectFit
        headerView.addSubview(profilePhoto)
        profilePhoto.frame = CGRect(
            x:(view.width-(view.width/4))/2,
            y:(headerView.height-(view.width/4))/1.8,
            width:view.width/4,
            height:view.width/4)
        
    }
    
    
    //Sign Out
    @objc private func didTapSignOut(){
        let sheet = UIAlertController(title: "Sign Out", message: "Are you sure?", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut{[weak self]success in
                if success{
                    DispatchQueue.main.async {
                        UserDefaults.standard.set (nil, forKey:"email")
                        UserDefaults.standard.set (nil, forKey:"name")
                        let signInVC=SigninViewController();
        
                        signInVC.navigationItem.largeTitleDisplayMode = .always
                        let navVC = UINavigationController(rootViewController: signInVC)
                        navVC.navigationBar.prefersLargeTitles=true
                        navVC.modalPresentationStyle = .fullScreen
                        self?.present(navVC, animated: true, completion: nil)
                    }
                }
            }
            
        }))
        present(sheet, animated: true)

    }
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel?.text = "Blog post goes here!"
        return cell
    }
    
    
    

}
