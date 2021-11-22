//
//  SearchbyCompanyidTableViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit
import CoreData
class SearchbyCompanyidTableViewController: UITableViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var items:[StockCore]?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStockbyCompany()
    }
    func fetchStockbyCompany(){
        do{
            
        let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
        let currCompany=SearchByCompanyViewController.choosedCompany
            let pred=NSPredicate(format: "ofCompany.name CONTAINS %@", currCompany!.name!)
            
        request.predicate=pred
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }


    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StockTableViewCell

        var Stock=items![indexPath.row]
         
       
        cell.Name.text = Stock.name
        cell.Company.text = Stock.ofCompany?.name!
        cell.pricce.text=Stock.lastTradePrice.description
        cell.rating.text=Stock.financialRating.description
        cell.Category.text=Stock.ofCategory?.name!
           return (cell)
       }
     
    
}
