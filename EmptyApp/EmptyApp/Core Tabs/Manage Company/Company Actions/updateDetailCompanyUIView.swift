//
//  updateDetailCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation

import UIKit
class UpdateCompanyUIView: UIView, UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
     
    //back button
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("<Back", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(closeWindow),for: .touchUpInside)
        button.frame=CGRect.init(x:20,y:40,width:100,height:25)
        return button
    }()
    
    
     //header
     private let label: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 20, weight: .medium)
         label.text = "Select Company to update"
         return label
     }()

     
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .systemGray
        self.addSubview(backButton)
        self.addSubview(label)
        tableView = UITableView(frame: CGRect(x: 0, y:100, width: 350, height:500))
        tableView.backgroundColor = .systemYellow
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.addSubview(tableView)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.companylist.testCompanylist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
          return (cell)
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selected = AppDelegate.GlobalVariable.companylist.testCompanylist.toString()[indexPath.row]
        let id=Int(selected.split(separator: " ")[0])!
        AppDelegate.GlobalVariable.selectedCompany=id
        //print(applicationViewController.GlobalVariable.selected)
     DispatchQueue.main.async {
         let nextview=UpdateDetailCompanyUIView()
         self.addSubview(nextview)
         self.bringSubviewToFront(nextview)
        }
       
        
   
        }
    
    
    @objc func closeWindow(sender : UIButton) {
        let nextview=ManagerCompanyView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }

}
