//
//  PlaceOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class PlaceOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!

    var datepicked:Date=Date()
    
    @IBOutlet weak var DatePick: UITextField!
    private var DatePicker = UIDatePicker()
    var order:Array<StockCore> = []
    var quantitylist:Array<Int> = []
   var tradeinprice: Array<Double> = []
   let customer = ViewCustomerTableViewController.choosedCustomer
    @IBOutlet weak var tableView: UITableView!
    
    @objc func dateChanged(datePicker:UIDatePicker){
        let dateformater=DateFormatter()
        dateformater.dateFormat="MM/dd/yyyy"
        
        DatePick.text = dateformater.string(from: DatePicker.date)
        datepicked=DatePicker.date
        view.endEditing(true)
    }
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        DatePicker.datePickerMode = .date
        DatePick.inputView=DatePicker
        DatePicker.addTarget(self, action: #selector(PlaceOrderViewController.dateChanged(datePicker:)), for : .valueChanged)
       
        DatePick.inputView=DatePicker
        let nib = UINib(nibName: "PlaceOrderCellView", bundle: nil)
        tableView.register(nib,
                                 forCellReuseIdentifier: "PlaceOrderTableViewSell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return  StockTableViewController.items?.count ?? 0
      }
  

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceOrderTableViewSell") as! PlaceOrderTableViewCell
       
     
       
        let Stock1 = StockTableViewController.items![indexPath.row]
        cell.id.text = Stock1.financialRating.description
        cell.Name.text=Stock1.name
        cell.LastPrice.text=Stock1.lastTradePrice.description
        
        return cell
        
    }

    @IBAction func didTapPlace(_ sender: UIButton) {
        if tableView.indexPathsForSelectedRows == nil{
            AlertofSelect()
        }else{
        //loop throught the selected rows
        for i in tableView.indexPathsForSelectedRows! {
            let currstock=StockTableViewController.items![i.row]
            order.append(currstock)
            tradeinprice.append(Double(currstock.lastTradePrice))
        
            let cell = tableView.cellForRow(at: i)as! PlaceOrderTableViewCell
            let quant = cell.QuantityField.text
            guard let quant = cell.QuantityField.text, !quant.isEmpty, Int(quant) != nil, Int(quant)! > 0 else {
                return Alert()
            }
            quantitylist.append(Int(quant)!)
        }
        
     
            var investment = 0.0
            for i in 0..<order.count {
                investment += order[i].lastTradePrice * Double((quantitylist[i]))
                
            }
                
        let alert = UIAlertController(title: "Placing Order", message: "you have invested $\(investment)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.placeOrder();DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
          
        }}))
        self.present(alert,animated:true,completion: nil)
        }
       

        
        
    }
    public func placeOrder(){
        //Calculating the total investment
        var investment = 0.0
        for i in 0..<order.count {
            investment += order[i].lastTradePrice * Double((quantitylist[i]))
            
        }
        //Create a Order Object
        let newOrderCore = OrderCore(context: self.context)
        newOrderCore.quantity=quantitylist
        newOrderCore.tradeinPrice=tradeinprice
        newOrderCore.invested=true
        for i in 0..<order.count {
            newOrderCore.addToOfStock(order[i])
            
        }
        if(DatePick.text != ""){
            newOrderCore.date=datepicked
        }else {
            newOrderCore.date=Date()
        }
        newOrderCore.addToOfCustomer(customer!)
        let total=customer!.totalInvestment
        customer!.totalInvestment=total+investment
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
    
    func AlertofSelect (){
        
        let alertController = UIAlertController(title:"Info",message:"Please select stocks first", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    

}
