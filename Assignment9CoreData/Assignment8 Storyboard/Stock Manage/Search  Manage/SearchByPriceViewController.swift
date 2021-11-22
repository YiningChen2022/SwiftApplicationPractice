//
//  SearchByPriceViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class SearchByPriceViewController:UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var name=""
    var price:Double=0.0
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var items:[StockCore]?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func fetchStockbyPrice(){
        do{
            
        let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
        
            let pred=NSPredicate(format: "lastTradePrice >= %f", price)
            
        request.predicate=pred
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }


    }
    @IBAction func didTapSearch(_ sender: UIButton) {
        
          name=nameField.text ?? ""
          if (Double(name) == nil){
              print ("not valid")
           
          }else {
             price=Double(name)!
              fetchStockbyPrice()
          }
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
        
    }
   
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{

       print(items?.count ?? 0)
            return items?.count ?? 0
        
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       let Stock = items![indexPath.row]
        
       cell.textLabel?.text = "\(Stock.name!) \(Stock.lastTradePrice)"
          return (cell)
      }
    
}
