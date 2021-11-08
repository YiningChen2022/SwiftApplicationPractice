//
//  PlaceOrderViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/5/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
  
        

    }
    

    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
        let customer = AppDelegate.GlobalVariable.customerlist.testcustomerlist.getCustomer(id: AppDelegate.GlobalVariable.selectedOrderid)
        let stock = AppDelegate.GlobalVariable.stocklist.testStocklist.getStock(id: AppDelegate.GlobalVariable.orderedStock)
        let order = Order(stock: stock!, quantity: Int(quant)!, invested: true, customer: customer!)
        AppDelegate.GlobalVariable.orderlist.testOrderlist.addOrder(Order: order)
        
        DispatchQueue.main.async {
            let vc = OrderViewController()
            self.present(vc, animated: true, completion: nil)
            
        }
    
    }
    
    
    func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }
}
