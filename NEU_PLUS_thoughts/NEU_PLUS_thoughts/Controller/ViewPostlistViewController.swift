//
//  ViewPostlistViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/9/21.
//

import UIKit

class ViewPostlistViewController: UIViewController,UITableViewDataSource, UITableViewDelegate
{
    var currentEmail:String?
    private var user:User?
    private var posts:[BlogPost]=[]
    @IBOutlet weak var tableView: UITableView!
    //function to fetch the posts
    private func fetchPosts(){
        guard let email = currentEmail else {
            return
        }
        print("Fetching Posts")
        
        DatabaseManager.shared.getPostForUser(for: email){[weak self]
            posts in self?.posts = posts
            print(posts.count)
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
        }
    }
    //func to fetch user
    private func fetchUser(email:String){
        DatabaseManager.shared.getUser(email: email){
            
            [weak self] user in
            guard let user = user else{
                return
            }
            self?.user = user
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post=posts[indexPath.row]
  
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        
        cell.textLabel?.text=post.title
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        currentEmail=currentUserEmail
        fetchUser(email:currentEmail!)
        fetchPosts()
        // Do any additional setup after loading the view.
    }
    

 

}
