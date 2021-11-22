//
//  CompanyTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit
import CoreData
class CompanyTableViewController: UITableViewController, UISearchResultsUpdating,UISearchBarDelegate {
  
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!

    public static var items=AppDelegate.GlobalVariable.CompanyCoreitems
    static var choosedCompany : CompanyCore?
    
    var searchController = UISearchController(searchResultsController:nil)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
    
        searchController.searchBar.delegate=self
        searchController.searchResultsUpdater=self
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.placeholder="Enter your search"
        self.definesPresentationContext=true
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        fetchCompany()

    }
    func fetchCompany(){
        do {
            CompanyTableViewController.items = try context.fetch(CompanyCore.fetchRequest())
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
       
        return CompanyTableViewController.items?.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Company") as! CustomerTableViewCell

        let Company = CompanyTableViewController.items![indexPath.row]
      
        cell.Name.text = Company.name
        cell.Symbol.text = Company.symbol
        cell.email.text=Company.email
        cell.hq.text=Company.headQuarter
        cell.CompanyLogo.image=Company.logo
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
            // Delete the row from the data source
            let toRemove = CompanyTableViewController.items![indexPath.row]
            self.context.delete(toRemove)
            do {
                try self.context.save()
            }catch{
                
            }
            self.fetchCompany()
            
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
        CompanyTableViewController.choosedCompany=CompanyTableViewController.items![indexPath.row]

        }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath:IndexPath){
      
        let vc=CompanyDetailViewController()
        vc.view.backgroundColor = .green
        self.navigationController?.show(vc, sender:self)
    }
    

}

