//
//  UpdateStockViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit
import CoreData
class UpdateStockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    static var choosedCompanyForStock : CompanyCore?
    static var choosedCategoryForStock : CategoryCore?
    let currStock = StockTableViewController.choosedStock
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lasttradefield: UITextField!
    
    @IBOutlet weak var tableView2: UITableView!
    
    @IBOutlet weak var Ratingfield: UITextField!
    
    @IBOutlet weak var tableView1: UITableView!
    let id = AppDelegate.GlobalVariable.selectedStock

    override func viewDidLoad() {
        UpdateStockViewController.choosedCompanyForStock=currStock?.ofCompany
        UpdateStockViewController.choosedCategoryForStock=currStock?.ofCategory
        super.viewDidLoad()
        if (( currStock) == nil){
            Alert1()
        }else{
            nameField.text=currStock?.name
            nameField.isEnabled=false

            lasttradefield.text = currStock?.lastTradePrice.description
            Ratingfield.text=currStock?.financialRating.description
            
        }
       
        
        super.viewDidLoad()
        tableView2.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCate")
        tableView2.dataSource = self
        tableView2.delegate = self
        
     
        

        tableView1.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "cellCom")
        tableView1.dataSource = self
        tableView1.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func Alert1 (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select a Company", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        if (tableView == tableView1){
            return CompanyTableViewController.items?.count ?? 0
        }else{
        return CategoryTableViewController.items?.count ?? 0
      }
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       if (tableView == self.tableView1){
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
        if (tableView == self.tableView1){
            UpdateStockViewController .choosedCompanyForStock=CompanyTableViewController.items![indexPath.row]
        }else{
            UpdateStockViewController.choosedCategoryForStock=CategoryTableViewController.items![indexPath.row]
        }
    
    }
    
    
    @IBAction func didTapUpdate(_ sender: UIButton) {
        guard
              let lastTrade=lasttradefield.text,  Double(lastTrade) != nil,
              let Fincial=Ratingfield.text,  Int(Fincial) != nil
              
        else{
                  return Alert()
              }
      
        currStock?.lastTradePrice=Double(lastTrade)!
        currStock?.financialRating=Int64(Fincial)!
        currStock?.ofCategory=UpdateStockViewController.choosedCategoryForStock
        currStock?.ofCompany=UpdateStockViewController.choosedCompanyForStock
        do{
            try self.context.save()
        }catch{
            
        }

    

        
    }
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }

    
    @IBAction func didName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    

}
