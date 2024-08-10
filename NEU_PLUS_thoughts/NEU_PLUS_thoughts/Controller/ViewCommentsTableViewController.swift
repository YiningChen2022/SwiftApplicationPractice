
//  ViewCommentsTableViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 12/16/21.
//

import UIKit

class ViewCommentsTableViewController: UITableViewController {
   var comments:[Comments]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicStyle")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comments.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentcell") as! CommentTableViewCell
            cell.textLabel?.numberOfLines = 0
        let comment = comments[indexPath.row]
        let time=getDateFromTimeStamp(timeStamp:comment.Date)
        cell.commenttime.text=time
        cell.User.text=comment.commentEmail
        cell.commenttext.text=comment.body
        cell.commenttext.numberOfLines = 0
        //cell.subtitle.text = comments[indexPath.row].commentEmail
            cell.selectionStyle = .none
            cell.textLabel?.font = .systemFont(ofSize: 18)
            return cell
    
        }
  
    //form time
    func getDateFromTimeStamp(timeStamp : Double) -> String {

        let date = Date(timeIntervalSince1970:timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST") //
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
            return strDate
        }
}
