//
//  AddStockViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit
import CoreData
class AddStockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
 
    static var choosedCompanyForStock : CompanyCore?
    static var choosedCategoryForStock : CategoryCore?
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var tradeField: UITextField!
    
    @IBOutlet weak var ratingField: UITextField!
    
    @IBOutlet weak var tableviewCompany: UITableView!
    
    @IBOutlet weak var tableviewCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewCategory.register(UITableViewCell.self,
                                    forCellReuseIdentifier: "cellCate")
        tableviewCategory.dataSource = self
        tableviewCategory.delegate = self
        tableviewCompany.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCom")
        tableviewCompany.dataSource = self
        tableviewCompany.delegate = self
        // Do any additional setup after loading the view.
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        if (tableView == tableviewCompany){
            return CompanyTableViewController.items?.count ?? 0
        }else{
        return CategoryTableViewController.items?.count ?? 0
      }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       if (tableView == self.tableviewCompany){
           let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cellCom")
           let Company = CompanyTableViewController.items![indexPath.row]
           cell.textLabel?.text = "\(Company.name!)  \(Company.email!)"
           return (cell)
       }else{
           let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
           let Catgory1 = CategoryTableViewController.items![indexPath.row]
           cell.textLabel?.text="\(Catgory1.name!)"
           return (cell)
       }
        
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if (tableView == self.tableviewCompany){
            AddStockViewController.choosedCompanyForStock=CompanyTableViewController.items![indexPath.row]
        }else{
            AddStockViewController.choosedCategoryForStock=CategoryTableViewController.items![indexPath.row]
        }
    
    }

    
    @IBAction func didTapAdd(_ sender: UIButton) {
        guard let name=nameField.text, !name.isEmpty,
              let lastTrade=tradeField.text, !lastTrade.isEmpty, Double(lastTrade) != nil ,Double(lastTrade)!>=0,
              let Fincial=ratingField.text, !Fincial.isEmpty, Int(Fincial) != nil,Int(Fincial)!>=1 , Int(Fincial)!<11,
              AddStockViewController.choosedCategoryForStock != nil,
              AddStockViewController.choosedCompanyForStock != nil
        else{
                  return Alert()
              }
        let newStockCore = StockCore(context: self.context)
        newStockCore.name=name
        newStockCore.financialRating=Int64(Fincial)!
        newStockCore.lastTradePrice=Double(lastTrade)!
        newStockCore.ofCompany=AddStockViewController.choosedCompanyForStock
        newStockCore.ofCategory=AddStockViewController.choosedCategoryForStock
        //save data
        do {
            try! self.context.save()
        }catch{
            
        }

    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
}
