//
//  ViewPostlistTableViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/8/21.
//

import UIKit

class ViewPostlistTableViewController: UITableViewController {
    var currentEmail:String?
    private var user:User?
    private var posts:[BlogPost]=[]
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
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUserEmail=UserDefaults.standard.string(forKey:"email") else {
            return
        }
        currentEmail=currentUserEmail
        fetchUser(email:currentEmail!)
        fetchPosts()
      
       
    }
    
    //fetch User
    private func fetchUser(email:String){
        DatabaseManager.shared.getUser(email: email){
            
            [weak self] user in
            guard let user = user else{
                return
            }
            self?.user = user
        }
    }
   
    // MARK: - Table view data source
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post=posts[indexPath.row]
        /*let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
         
        */
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewPostCell") as! ViewPostListTableViewCell
        cell.title.text=post.title
        cell.type.text=post.type
        cell.postimage.image=data.icons[0]
            // cell.detailTextLabel?.text=post.type
        //cell.imageView?.image=data.icons[0]
        if let url=post.headerImageUrl{
            let task = URLSession.shared.dataTask(with: url){
                [weak self] data, _, _ in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    print("fetching image")
                    cell.postimage.image=UIImage(data: data)
                }
            
        }
            task.resume()
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
     
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        print(posts[indexPath!.row].title)
        let detailViewController = segue.destination as! ViewPostViewController
        detailViewController.email = currentEmail

        detailViewController.currpost=posts[indexPath!.row]
    }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        let detailViewController = segue.destination as! ViewPostViewController
        detailViewController.email = currentEmail
        //let index = indexPath?.row
        detailViewController.currpost=posts[indexPath!.row]
    }
    */
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
