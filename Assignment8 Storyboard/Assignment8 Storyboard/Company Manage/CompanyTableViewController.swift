//
//  CompanyTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit

class CompanyTableViewController: UITableViewController, UISearchResultsUpdating,UISearchBarDelegate {
  
    

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

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return (AppDelegate.GlobalVariable.companylist.testCompanylist.getsize())
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        let str=AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
        let components = str.components(separatedBy: " ")
        cell.textLabel!.text = components[0]+" ."+components[1]
        cell.detailTextLabel?.text = components[2]+","+components[3]+", "+components[4]
        cell.imageView?.image=UIImage(named:"fb.png")
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
            let deleteselect = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
            let id = Int(deleteselect.split(separator: " ")[0])!
            AppDelegate.GlobalVariable.companylist.testCompanylist.DeleteCompany(id: id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
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
        let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
            let id=Int(selected.split(separator: " ")[0])!
            AppDelegate.GlobalVariable.selectedCompany=id
       
        
          let vc=CompanyDetailViewController()
          vc.view.backgroundColor = .green
          self.navigationController?.show(vc, sender:self)
           
           
            
        }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath:IndexPath){
      
        let vc=CompanyDetailViewController()
        vc.view.backgroundColor = .green
        self.navigationController?.show(vc, sender:self)
    }
    

}

