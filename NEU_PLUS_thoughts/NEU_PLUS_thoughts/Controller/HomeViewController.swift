//
//  HomeViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/8/21.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    private var posts:[BlogPost]=[]
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(posts.count)
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post=posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "home") as! HomePostTableViewCell
        let time=getDateFromTimeStamp(timeStamp: post.timestamp)
        cell.timefirld.text=time
        cell.type.text=post.type
        cell.titleFirld.text=post.title
        
        //cell.postimage.image=
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
    func getDateFromTimeStamp(timeStamp : Double) -> String {

            let date = NSDate(timeIntervalSince1970: timeStamp / 1000)
            
            let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
         // UnComment below to get only time
        //  dayTimePeriodFormatter.dateFormat = "hh:mm a"

            let dateString = dayTimePeriodFormatter.string(from: date as Date)
            return dateString
        }
    //Fetch All Posts from user
    private func fetchAllPosts(){
        
        print("Fetching home feed")
        
        DatabaseManager.shared.getAllPosts{[weak self] posts in self?.posts = posts
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchAllPosts()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
