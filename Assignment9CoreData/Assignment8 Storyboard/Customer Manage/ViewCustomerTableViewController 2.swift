//
//  ViewCustomerTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/11/21.
//

import UIKit
import CoreData
class ViewCustomerTableViewController: UITableViewController, UISearchResultsUpdating,UISearchBarDelegate {
  
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var items=AppDelegate.GlobalVariable.CustomerItems
    static var choosedCustomer : CustomerCore?
    

    var searchController = UISearchController(searchResultsController:nil)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
      /*  let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:nil)
        
        self.navigationItem.rightBarButtonItem = addButton*/
        searchController.searchBar.delegate=self
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Enter your search"
        self.definesPresentationContext=true
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        fetchCustomer()
    }
    func fetchCustomer(){
        do {
            self.items = try context.fetch(CustomerCore.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return self.items?.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let Customer = self.items![indexPath.row]
        
        cell.textLabel!.text = "\( Customer.firstName!) \( Customer.lastName!)"
        cell.detailTextLabel?.text = "\( Customer.contactDetails), \( Customer.emailID!), \( Customer.address!)"
       
          return (cell)
      }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
        print (text )
    }
    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let toRemove = self.items![indexPath.row]
            self.context.delete(toRemove)
            do {
                try self.context.save()
            }catch{
                
            }
            self.fetchCustomer()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        ViewCustomerTableViewController.choosedCustomer=self.items![indexPath.row]

           
           
            
        }
    

}
