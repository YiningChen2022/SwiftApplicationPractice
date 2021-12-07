//
//  SellStockViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class SellStockViewController: UIViewController {

    var datepicked:Date=Date()
    
    @IBOutlet weak var DatePick: UITextField!
    private var DatePicker = UIDatePicker()
    
    @IBOutlet weak var quantityfield: UITextField!
    
    var selectstock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.sellStockid)
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
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
    
    
    override func viewDidLoad() {
        DatePicker.datePickerMode = .date
        DatePick.inputView=DatePicker
        DatePicker.addTarget(self, action: #selector(PlaceOrderViewController.dateChanged(datePicker:)), for : .valueChanged)
   
        DatePick.inputView=DatePicker
        stockfield.text=selectstock?.getName()
        let orderedQuantity=AppDelegate.GlobalVariable.orderlist.testOrderlist.totalStockQuantityforCustomer(customer: customer!, stock: selectstock!)
        let selledQuantity=AppDelegate.GlobalVariable.SellStocklist.testSellStocklist.SellStockQuantityforCustomer(customer: customer!, stock: selectstock!)
        let quant1 = orderedQuantity-selledQuantity
        quantity.text=String(quant1)
        
        AvgCost.text=String(AppDelegate.GlobalVariable.orderlist.testOrderlist.avgforCustomer(customer: customer!, stock: selectstock!))
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSell(_ sender: UIButton) {
       let owned = AppDelegate.GlobalVariable.orderlist.testOrderlist.totalStockQuantityforCustomer(customer: customer!, stock: selectstock!)
        guard let quant = quantityfield.text, !quant.isEmpty, Int(quant) != nil,Int(quant)! <= owned else {
            return Alert()
        }

        let stock = AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.sellStockid)
        let Earning = (stock?.getlastTradePrice())!*Double(quant)!
    
        let sellStock = SellStock(stock: stock!, quantity: Int(quant)!, customer: customer!,  Earning:Earning, Company: stock!.company)
   

        let alert = UIAlertController(title: "selling Stocks", message: "you will Earn $\(Earning)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.SellOrder(sellStock:sellStock,quant:Double(quant)!);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
        }}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
        
    public func SellOrder(sellStock:SellStock,quant:Double){
        
        let stock = AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.sellStockid)
        let Earning = ((stock?.getlastTradePrice())!)*Double(quant)
    
        customer?.setTotalEarning(Earning: Earning)
        
        AppDelegate.GlobalVariable.SellStocklist.testSellStocklist.addSellStock(SellStock: sellStock)
        
    }
    
    
   
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
        
        
    
    
    
    
  
    

}
