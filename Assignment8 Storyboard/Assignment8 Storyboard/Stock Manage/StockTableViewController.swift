//
//  StockTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/14/21.
//

import UIKit

class StockTableViewController: UITableViewController, UISearchResultsUpdating,UISearchBarDelegate {
    
    var filteredObjects:[String]=[String]()
    var searchController = UISearchController(searchResultsController:nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
        filterContentForSearchText(text)
    }
    func filterContentForSearchText (_ searchText:String){
        filteredObjects=AppDelegate.GlobalVariable.stocklist.testStocklist.toString().filter({(token:String)->Bool in
            if (searchController.searchBar.text?.isEmpty)!{
                return true
                
            }else {
                return token.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    func isFiltering()->Bool{
        return searchController.isActive && !(searchController.searchBar.text?.isEmpty)!
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let text=searchBar.text
        filterContentForSearchText(text!)
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem=self.editButtonItem
        
        navigationItem.searchController=searchController
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
        var res=0
        if (isFiltering()){
            res=filteredObjects.count
        }else {
            res=AppDelegate.GlobalVariable.stocklist.testStocklist.getsize()
        }
       
        return res
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        var str=""
        if (isFiltering()){
            str = filteredObjects[indexPath.row]
        }else{ str=AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[indexPath.row]
        }
        let components = str.components(separatedBy: " ")
        cell.textLabel!.text = components[0]+" . "+components[1]
        
          return (cell)
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
            let deleteselect = AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[indexPath.row]
            let id = Int(deleteselect.split(separator: " ")[0])!
            AppDelegate.GlobalVariable.stocklist.testStocklist.DeleteStock(id: id)
            
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
        let selected = AppDelegate.GlobalVariable.stocklist.testStocklist.toString() [indexPath.row]
            let id=Int(selected.split(separator: " ")[0])!
            AppDelegate.GlobalVariable.selectedStock=id
       

        }


}

