//
//  ManageCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/27/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageCustomerViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {


     let testcustomerlist = CustomerDirecrtory(customerList: Array())

    private let tableView: UITableView={
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        tableView.frame=view.bounds
        
    }
    //back button
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    // add customer
    private let addCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Add Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    // Delete customer
    private let deleteCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("deleteCustomer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // update customer
    private let updateCustomerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Delete Customer", for: .normal )
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    

    
    

    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
        view.addSubview(backButton)
        view.addSubview(addCustomerButton)
        view.addSubview(updateCustomerButton)
        view.addSubview(deleteCustomerButton)
  
         setUpTable()
        

        let customer1 = Customer(firstName: "James", lastName: "James", address: "123 st", contactDetails: "618-111-1111", emailID: "James@gmail.com")
        let customer2 = Customer(firstName: "Robert", lastName: "Robert", address: "234 st", contactDetails: "618-222-2222", emailID: "Robert@gmail.com")
        let customer3 = Customer(firstName: "Mary", lastName: "Mary", address: "345 st", contactDetails: "618-333-3333", emailID: "mary@gmail.com")
        let customer4 = Customer(firstName: "Patricia", lastName: "Patricia", address: "456 st", contactDetails: "618-444-4444", emailID: "Patricia@gmail.com")
        testcustomerlist.addCustomer(Customer: customer1)
        testcustomerlist.addCustomer(Customer: customer2)
        testcustomerlist.addCustomer(Customer: customer3)
        testcustomerlist.addCustomer(Customer: customer4)
  
        backButton.addTarget(self, action:#selector(didTapback),for: .touchUpInside)
        addCustomerButton.addTarget(self, action:#selector(didTapadd),for: .touchUpInside)
        updateCustomerButton.addTarget(self, action:#selector(didTapUpdate),for: .touchUpInside)
        deleteCustomerButton.addTarget(self, action:#selector(didTapDelete),for: .touchUpInside)

    }
    private func setUpTable(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableHeader()
        
    }
    private func setUpTableHeader(){
        let headerView = UIView(frame:CGRect(x:0,y:0,width:500, height: 300))
        headerView.backgroundColor = .white
        headerView.isUserInteractionEnabled=true
        headerView.clipsToBounds=true
        tableView.tableHeaderView=headerView
        
        backButton.frame=CGRect(x:20,y:40,width:100,height:25)
    
        addCustomerButton.frame=CGRect(x: 80, y: 100, width: 150, height: 25)
        updateCustomerButton.frame=CGRect(x: 80, y: 150, width: 150, height: 25)
        deleteCustomerButton.frame=CGRect(x: 80, y: 200, width: 150, height: 25)
 

        headerView.addSubview(backButton)
        headerView.addSubview(addCustomerButton)
        headerView.addSubview(updateCustomerButton)
        headerView.addSubview(deleteCustomerButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc private func didTapback(){
        DispatchQueue.main.async {
         
            let signInVC=applicationViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapadd(){
        DispatchQueue.main.async {
         
            let addVC=AddViewController();

          
            let navVC = UINavigationController(rootViewController: addVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapUpdate(){
        DispatchQueue.main.async {
         
            let signInVC=applicationViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }
    @objc private func didTapDelete(){
        DispatchQueue.main.async {
         
            let signInVC=applicationViewController();

          
            let navVC = UINavigationController(rootViewController: signInVC)
          
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: false, completion: nil)
        }
    }

    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
          return (testcustomerlist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
          cell.textLabel?.text = testcustomerlist.toString()[indexPath.row]
          return (cell)
      }

}
