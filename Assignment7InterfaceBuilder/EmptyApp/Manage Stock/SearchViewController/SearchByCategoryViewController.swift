//
//  SearchByCategoryViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 11/4/21.
//  Copyright © 2021 rab. All rights reserved.
//

import UIKit

class SearchByCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        AppDelegate.GlobalVariable.selectedCategorySearch=id
        DispatchQueue.main.async {
            let vc = CategorySelectedViewController()
                self.present(vc, animated: true, completion: nil)
    }
    }
    
    
    @IBAction func CloseWindow(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
}

/*
 import UIKit

 class SearchByNameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var name=""
     
     @IBOutlet weak var nameField: UITextField!
     @IBOutlet weak var tableView: UITableView!
     
     
     
    /* @IBAction func didTapSearch(_ sender: UIButton) {
         tableView.register(UITableViewCell.self,
                                  forCellReuseIdentifier: "AnimalCell")
         tableView.dataSource = self
         tableView.delegate = self
     }
     */
     
     
     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
     }
     //Table View
     func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
       
         name=nameField.text ?? ""
         return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchNamegetsize(name: name))
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
       
           let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByName(name: name)[indexPath.row]
           return (cell)
       }
     
     @IBAction func CloseWindow(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
     }
     
 }

 */
