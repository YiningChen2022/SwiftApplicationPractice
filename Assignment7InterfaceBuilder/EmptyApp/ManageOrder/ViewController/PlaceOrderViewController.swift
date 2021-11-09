//
//  PlaceOrderViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/5/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
  
        

    }
    

    

    
    @IBOutlet weak var quantity: UITextField!
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.toStringShort()[indexPath.row]
          return (cell)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selected = AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.orderedStock=id

    
   
        }
    
    

    @IBAction func didTapPlace(_ sender: UIButton) {

        guard let quant = quantity.text, !quant.isEmpty, Int(quant) != nil else {
            return Alert()
        }

        let stock = AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.orderedStock)
        let investment = (stock?.getlastTradePrice())!*Double(quant)!
    
        let order = Order(stock: stock!, quantity: Int(quant)!, invested: true, customer: customer!,tradeinPrice: (stock?.getlastTradePrice())!)

        let alert = UIAlertController(title: "Placing Order", message: "you have invested $\(investment)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.placeOrder(order:order,quant:Double(quant)!);DispatchQueue.main.async {
            let vc = OrderViewController()
                self.present(vc, animated: true, completion: nil)}}))
        self.present(alert,animated:true,completion: nil)
        
       
    }
        
    public func placeOrder(order:Order,quant:Double){
        
        let stock = AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.orderedStock)
        let investment = (stock?.getlastTradePrice())!*quant
    
        customer?.setTotalInvestment(investment: investment)
        AppDelegate.GlobalVariable.orderlist.testOrderlist.addOrder(Order: order)
        
    }
    
    
    @IBAction func closewindow(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
    
    
    @IBAction func didTapAddanother(_ sender: Any) {
        
        let vc = PlaceOrderViewController()
            self.present(vc, animated: true, completion: nil)
        
    }
    
}
