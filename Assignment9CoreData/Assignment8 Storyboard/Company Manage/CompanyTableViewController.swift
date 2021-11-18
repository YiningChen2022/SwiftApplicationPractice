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
      
       /* let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "Company") as! CustomerTableViewCell

        let str=AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
        print(str)
        let components = str.components(separatedBy: " ")
        cell.Name.text = components[0]+" "+components[1]
        cell.Symbol.text = components[2]
        cell.email.text=components[3]
        cell.hq.text=components[4]
        var currentcompany=AppDelegate.GlobalVariable.companylist.testCompanylist.getCompany(id: Int(components[0])!)
        cell.CompanyLogo.image=currentcompany?.getLogo()
        
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
       

        }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath:IndexPath){
      
        let vc=CompanyDetailViewController()
        vc.view.backgroundColor = .green
        self.navigationController?.show(vc, sender:self)
    }
    

}

