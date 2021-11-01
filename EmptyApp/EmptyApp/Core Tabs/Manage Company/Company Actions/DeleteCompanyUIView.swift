//
//  DeleteCompanyViewController.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/30/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class DeleteCompanyUIView: UIView,UITableViewDelegate, UITableViewDataSource {
 
    private let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Home", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(gotoHome),for: .touchUpInside)
        button.frame=CGRect.init(x:250,y:40,width:50,height:25)
        return button
    }()
    
    @objc func gotoHome(sender : UIButton) {
        let nextview=MainPage()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)

   }
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

        
        override init (frame : CGRect) {
            super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
            tableView = UITableView(frame: CGRect(x: 0, y:100, width: 350, height:500))
            tableView.backgroundColor = .systemYellow
            tableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: "AnimalCell")
            tableView.dataSource = self
            tableView.delegate = self
            self.addSubview(tableView)
            self.addSubview(backButton)
            backgroundColor = .white
            addSubview(homeButton)
            
         
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
           
            let alert = UIAlertController(title: "Are you sure?", message: "Delete this Company", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in self.delete(Id:id);DispatchQueue.main.async {
                let parentWin:UIView = tableView.superview!;
                parentWin.removeFromSuperview()
           }
            } ))
            if let viewController = self.window?.rootViewController   {                         viewController.present(alert, animated: true) {
            }
            }
            
            
           
        }
           public func delete(Id:Int){
               AppDelegate.GlobalVariable.companylist.testCompanylist.DeleteCompany(id: Id)
               
           }
        @objc func closeWindow(sender : UIButton) {
            let nextview=ManagerCompanyView()
            self.addSubview(nextview)
            self.bringSubviewToFront(nextview)
       }
        
        
         
    }

