//
//  ToDoListViewViewController.swift
//  NEU_PLUS_thoughts
//
//  Created by Yining Chen on 8/11/24.
//

import UIKit

class ToDoListViewViewController: UIViewController {
    
    @IBOutlet weak var toDoListtableView: UITableView!
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get all current saved task
    }
}

 
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int)-> Int {
        return tasks.count
    }
    func tableView (_ tableView: <#T##UITableView#>, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "toDoListCell ", for: <#T##IndexPath#>)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        }
    }

