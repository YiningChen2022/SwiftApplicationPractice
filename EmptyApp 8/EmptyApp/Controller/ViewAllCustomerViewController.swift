//
//  ViewAllCustomerViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/29/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class ViewAllCustomerViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {

   
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

    
 

    
    

    
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(backButton)

         setUpTable()
         
     
     
  
        backButton.addTarget(self, action:#selector(didTapback),for: .touchUpInside)
     
    }
    private func setUpTable(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableHeader()
        
        
    }
    private func setUpTableHeader(){
        let headerView = UIView(frame:CGRect(x:0,y:0,width:500, height: 200))
        headerView.backgroundColor = .white
        headerView.isUserInteractionEnabled=true
        headerView.clipsToBounds=true
        tableView.tableHeaderView=headerView
        
        backButton.frame=CGRect(x:20,y:40,width:100,height:25)
        headerView.addSubview(backButton)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc private func didTapback(){
        DispatchQueue.main.async {
         
            let signInVC=ManageCustomerViewController();
          
         
            signInVC.modalPresentationStyle = .fullScreen
            self.present( signInVC, animated: true, completion: nil)
        }
    }
  

    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.customerlist.testcustomerlist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.customerlist.testcustomerlist.toString()[indexPath.row]
          return (cell)
      }

}
