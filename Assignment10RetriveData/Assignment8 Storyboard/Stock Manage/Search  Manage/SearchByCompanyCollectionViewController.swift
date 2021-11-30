//
//  SearchByCompanyCollectionViewController.swift
//  Assignment8 Storyboard
//
//  Created by Yining Chen on 11/15/21.
//

import UIKit


class SearchByCompanyViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    static var choosedCompany : CompanyCore?
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
        
        return CompanyTableViewController.items?.count ?? 0
                   
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       let Company = CompanyTableViewController.items![indexPath.row]
       cell.textLabel?.text = "\(Company.name!) \(Company.email!)"
          return (cell)
      }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        SearchByCompanyViewController.choosedCompany=CompanyTableViewController.items![indexPath.row]
     
    }
    
   
 

}
