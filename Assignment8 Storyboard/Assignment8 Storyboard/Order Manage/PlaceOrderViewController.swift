//
//  PlaceOrderViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/16/21.
//

import UIKit

class PlaceOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var order:Array<Stock> = []
    var quantitylist:Array<Int> = []
   var tradeinprice: Array<Double> = []
   let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PlaceOrderCellView", bundle: nil)
        tableView.register(nib,
                                 forCellReuseIdentifier: "PlaceOrderTableViewSell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true

        // Do any additional setup after loading the view.
    }
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.getsize())
      }
  

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceOrderTableViewSell") as! PlaceOrderTableViewCell
        //print(AppDelegate.GlobalVariable.stocklist.testStocklist.toStringShort()[indexPath.row])
        let str=AppDelegate.GlobalVariable.stocklist.testStocklist.toStringShort()[indexPath.row]
        
        let components = str.components(separatedBy: " ")
   
        
        cell.id.text = components[0]
        cell.Name.text=components[1]
        cell.LastPrice.text=components[2]
        
        return cell
        
    }

    @IBAction func didTapPlace(_ sender: UIButton) {
        if tableView.indexPathsForSelectedRows == nil{
            AlertofSelect()
        }else{
        for i in tableView.indexPathsForSelectedRows! {
            let selected = AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[i.row]
            let id=Int(selected.split(separator: " ")[0])!
            let curstock=AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: id)
           order.append(curstock!)
            tradeinprice.append(Double(curstock!.lastTradePrice))
        
            let cell = tableView.cellForRow(at: i)as! PlaceOrderTableViewCell
            let quant = cell.QuantityField.text
            guard let quant = cell.QuantityField.text, !quant.isEmpty, Int(quant) != nil, Int(quant)! > 0 else {
                return Alert()
            }
            quantitylist.append(Int(quant)!)
        }
        var investment = 0.0
        for i in 0..<order.count {
            investment += order[i].getlastTradePrice() * Double((quantitylist[i]))
            
        }
        let order = Order(stock: order, quantity: quantitylist, invested: true, customer: customer!, tradeinPrice: tradeinprice)

        let alert = UIAlertController(title: "Placing Order", message: "you have invested $\(investment)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.placeOrder(order1:order);DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
          
        }}))
        self.present(alert,animated:true,completion: nil)
        }
       

        
        
    }
    public func placeOrder(order1:Order){
        var investment = 0.0
        for i in 0..<order.count {
            investment += order[i].getlastTradePrice() * Double((quantitylist[i]))
        }
        customer?.setTotalInvestment(investment: investment)
        AppDelegate.GlobalVariable.orderlist.testOrderlist.addOrder(Order: order1)
        
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
