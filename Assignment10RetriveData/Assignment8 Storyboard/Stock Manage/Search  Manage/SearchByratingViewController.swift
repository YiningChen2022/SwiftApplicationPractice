//
//  SearchByratingViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class SearchByratingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var items:[StockCore]?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    var name=""
    var rate:Int64=0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func fetchStockbyrating(){
        do{
            
        let request = StockCore.fetchRequest() as NSFetchRequest<StockCore>
           
            let pred=NSPredicate(format: "financialRating >=  %d", rate)
            
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
        if (Int(name) == nil){
            print ("not valid")
           
        }else {
            rate=Int64(name)!
            fetchStockbyrating()
        }
        DispatchQueue.main.async {
            self.tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        return items?.count ?? 0
        
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       let Stock = items![indexPath.row]
        
       cell.textLabel?.text = "\(Stock.name!) \(Stock.financialRating)"
          return (cell)
      }
    

}



