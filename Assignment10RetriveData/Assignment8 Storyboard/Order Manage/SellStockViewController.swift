//
//  SellStockViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit
import CoreData
class SellStockViewController: UIViewController {
    var context: NSManagedObjectContext=(UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    public static var items=AppDelegate.GlobalVariable.SellStockCoreitmes
    var datepicked:Date=Date()
    var quan=0
    @IBOutlet weak var DatePick: UITextField!
    private var DatePicker = UIDatePicker()
    
    @IBOutlet weak var quantityfield: UITextField!
    
    var selectstock=AppDelegate.GlobalVariable.selectedStockToSell
    let customer = ViewCustomerTableViewController.choosedCustomer
    var orderlist=ViewAllOrderTableViewController.items
    
    @IBOutlet weak var stockfield: UILabel!

    @IBOutlet weak var AvgCost: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    
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
    func fetchSellStockCore(){
        do {
            SellStockViewController.items = try context.fetch(SellStockCore.fetchRequest())
      
        }catch {
            
        }

    }
    
    override func viewDidLoad() {
        fetchSellStockCore()
        DatePicker.datePickerMode = .date
        DatePick.inputView=DatePicker
        DatePicker.addTarget(self, action: #selector(PlaceOrderViewController.dateChanged(datePicker:)), for : .valueChanged)
   
        DatePick.inputView=DatePicker
        stockfield.text=selectstock?.name
        //Calculating the total quantity for this stock
     
        for order in orderlist! {
            for currcustomer in order.ofCustomer!.allObjects as! [CustomerCore] {
                if (currcustomer.isEqual(customer)){
                    var index=0
                    for  currStock in order.ofStock!.allObjects
                            as![StockCore]{
                        
                        if (currStock == selectstock){
                            quan+=order.quantity![index]
                        }
                        index+=1
                    }
                }
            }
        }
        let orderedQuantity=quan
        quantity.text=String(orderedQuantity)
        
    //calculate the already selled stock quantity
        var selledQuantity=0
        if (SellStockViewController.items == nil){
            
        }else{
        for selledStock in SellStockViewController.items!{
            for currcustomer in selledStock.ofCustomer!.allObjects as! [CustomerCore] {
                if (currcustomer.isEqual(customer)){
                    for  currStock in selledStock.ofStock!.allObjects
                            as![StockCore]{
                        if (currStock == selectstock){
                            selledQuantity+=Int(selledStock.quantity)
                        }
                    }
                    
                }
            }
        }
        }
        
        
        let quant1 = orderedQuantity-selledQuantity
        quantity.text=String(quant1)
        
       
       /* AvgCost.text=String(AppDelegate.GlobalVariable.orderlist.testOrderlist.avgforCustomer(customer: customer!, stock: selectstock!))*/
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSell(_ sender: UIButton) {
       
      let owned = quan
        guard let quant = quantityfield.text, !quant.isEmpty, Int(quant) != nil,Int(quant)! <= owned else {
            return Alert()
        }

     
        let Earning = selectstock!.lastTradePrice*Double(quant)!
    
    

        let alert = UIAlertController(title: "selling Stocks", message: "you will Earn $\(Earning)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.SellOrder(quant:Double(quant)!);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
        
    public func SellOrder(quant:Double){
        let newSellStockCore = SellStockCore(context: self.context)
        let Earning = selectstock!.lastTradePrice*quant
    
    
        newSellStockCore.quantity=Int64(quant)
        newSellStockCore.earning=Earning
        newSellStockCore.addToOfStock(selectstock!)
        newSellStockCore.addToOfCustomer(customer!)
        if(DatePick.text != ""){
            newSellStockCore.date=datepicked
        }else {
            newSellStockCore.date=Date()
        }
        let total=customer!.totalEarning
        customer!.totalEarning=total+Earning
        

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

