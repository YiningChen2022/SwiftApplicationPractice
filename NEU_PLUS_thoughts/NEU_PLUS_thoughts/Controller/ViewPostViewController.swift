//
//  ViewPostViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/7/21.
//

import UIKit

class ViewPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    var currcomment=""
    var email: String!
    var currpost: BlogPost!
    private var comments:[Comments]=[]
    @IBOutlet weak var postImage: UIImageView!
    //post table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //title, type, author, text, comment
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
   
        switch index{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text=currpost.title
            cell.selectionStyle = .none
            cell.textLabel?.font = .systemFont(ofSize: 25, weight:. bold)
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text="Category: \(currpost.type)"
            cell.textLabel?.font = .systemFont(ofSize: 18)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text=currpost.postUser
            cell.selectionStyle = .none
            cell.textLabel?.font = .systemFont(ofSize: 18)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text=currpost.text
            cell.selectionStyle = .none
            cell.textLabel?.font = .systemFont(ofSize: 18)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
            cell.textLabel?.numberOfLines = 0
   
            if (!comments.isEmpty){
                let sentence="There are \(comments.count) comments! \n See the lastest commment below : \n \(comments[0].commentEmail) :  \(comments[0].body)"
                cell.textLabel?.text = sentence
            cell.selectionStyle = .none
            cell.textLabel?.font = .systemFont(ofSize: 18)
            }
            return cell
        default:
            fatalError()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        switch index{
        case 0:
          return 70
            
        case 1:
            return UITableView.automaticDimension
        
        case 2:
            return UITableView.automaticDimension
        case 3:
            return UITableView.automaticDimension
        case 4:
            return UITableView.automaticDimension
        default:
            fatalError()
        }
        
    }
 
   
        
        
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicStyle")
       
        postImage.layer.cornerRadius = 30
        postImage.clipsToBounds = true
        fetchcomments()
  
        
        if let url=currpost.headerImageUrl{
            let task = URLSession.shared.dataTask(with: url){
                [weak self] data, _, _ in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    print("fetching image")
                    self?.postImage.image=UIImage(data: data)
                }
            
        }
            task.resume()
        }
        // Do any additional setup after loading the view.
    }
  
    
    //comment handling
    @IBAction func didTapComment(_ sender: Any) {
        showAlert()
        
    }
    //fetch all comments
    private func fetchcomments(){
        DatabaseManager.shared.getCommentForPosts(for: currpost.postUserEmail ?? "", for: currpost.identifier){[weak self]
            comments in self?.comments = comments
            self?.comments = comments.sorted{ $0.Date > $1.Date }
            
            DispatchQueue.main.async{
                self!.tableView.reloadData()
            }
        }
        
    }
    
   
    
    func showAlert(){
        let alert = UIAlertController(
            title:"Comment", message: "Please leave your comment",
            preferredStyle: .alert
        
        )
        alert.addTextField{
            field in
            field.placeholder="Comment"
            field.returnKeyType = .next
        }
        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler:nil))
        alert.addAction(UIAlertAction(title:"Continue", style: .default,handler:{ _ in
            
            guard let fields = alert.textFields,fields.count==1 else{
                return
            }
            let commentfield = fields[0]
            guard let  comment=commentfield.text, !comment.isEmpty
            else{
                print("empty comment")
                return
            }
            self.currcomment=(comment)
            print(comment)
            self.insertComment()
            self.fetchcomments()
            
        }))
        
        present(alert, animated: true)
    }
    
    
    
    func insertComment(){
       
        let curruseremail = UserDefaults.standard.string(forKey: "email")
        let commentid=UUID().uuidString
        let comment=Comments(id: commentid, body: currcomment, Date: Date().timeIntervalSince1970, commentedPostid: currpost.identifier, commentEmail: curruseremail!)
        DatabaseManager.shared.insertComments(email: currpost.postUserEmail ?? "", postid: currpost.identifier, comments: comment ){
            [ weak self]
            commented  in guard commented else {
                print("Failed to insert comment")
                return
            }
           
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
           
               
                let detailViewController = segue.destination as! ViewCommentsTableViewController
                detailViewController.comments=comments

                
              
            
        }

}
