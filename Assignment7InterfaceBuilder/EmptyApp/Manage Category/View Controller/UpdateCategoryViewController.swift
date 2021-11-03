//
//  UpdateCategoryViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/3/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class UpdateCategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.categorylist.testCategorylist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
          return (cell)
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selected = AppDelegate.GlobalVariable.categorylist.testCategorylist.toString()[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.selectedCategory=id
        DispatchQueue.main.async {
            let vc = UpdateDetailCategoryViewController()
               self.present(vc, animated: true, completion: nil)
           }
   
        }
    
    @IBAction func closewindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
/*
 import UIKit

 class UpdateDetailCategoryViewController: UIViewController {

     @IBOutlet weak var namedield: UITextField!
     override func viewDidLoad() {
         super.viewDidLoad()
         let id = AppDelegate.GlobalVariable.selectedCategory
         let currentCategory=AppDelegate.GlobalVariable.categorylist.testCategorylist.getCategory(id: id)
       
         // Do any additional setup after loading the view.
     }
     

    /* @IBAction func didTapUpdateCategory(_ sender: UIButton) {
         guard let name=namedield.text, !name.isEmpty
            
         else{
                   return Alert()
               }
         
         AppDelegate.GlobalVariable.categorylist.testCategorylist.UpdateCategory(id: AppDelegate.GlobalVariable.selectedCategory, name: name)
     
         let vc = ManageCategoryViewController()
            self.present(vc, animated: true, completion: nil)
     
     }
 func Alert (){
     
     let alertController = UIAlertController(title:"Info",message:"Valid input", preferredStyle:  .alert)
     let OKAction = UIAlertAction(title: "OK", style:  .default, handler: nil)
     alertController.addAction(OKAction)
     self.present(alertController,animated:true,completion: nil)
 }
     
     @IBAction func closewindow(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
     }*/
     
 }

 */
