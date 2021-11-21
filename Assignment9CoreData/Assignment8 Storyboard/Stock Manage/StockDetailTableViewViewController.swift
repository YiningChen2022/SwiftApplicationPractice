//
//  StockDetailTableViewViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit
import CoreData
class StockDetailTableViewViewController: UIViewController {
    let currStock = StockTableViewController.choosedStock
    
    @IBOutlet weak var Category: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var tradePrice: UILabel!
    
    @IBOutlet weak var Rating: UILabel!
    
    @IBOutlet weak var Company: UILabel!
    let id = AppDelegate.GlobalVariable.selectedStock
    override func viewDidLoad() {
        super.viewDidLoad()
        
           if ((currStock) == nil){
               Alert()
           }else{
               Name.text=currStock!.name
               tradePrice.text = currStock!.lastTradePrice.description
               Rating.text=currStock!.financialRating.description
               Company.text=currStock!.ofCompany?.name
               Category.text=currStock!.ofCategory?.name
               
           }
              
     
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        func Alert (){
        
        let alertController = UIAlertController(title:"Info",message:"please select a stock ", preferredStyle:  .alert)
        let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController,animated:true,completion: nil)
    }

}
