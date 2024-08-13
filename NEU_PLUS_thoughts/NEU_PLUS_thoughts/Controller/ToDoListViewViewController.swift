//
//  ToDoListViewViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/11/24.
//

import UIKit

class ToDoListViewViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    var tasks = [String]()

    override func viewDidLoad() {    super.viewDidLoad()
        self.title = "To Do List"
        tableView.dataSource = self
        tableView.delegate = self
 
    }
    //init the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task=tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell") as! HomePostTableViewCell
        return cell
    }
    
    @IBAction func toDoListAddButton(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entryList") as! EntryListViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
