//
//  SearchByName.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit

class SearchByName :UIView, UITableViewDelegate, UITableViewDataSource {
    var tableView:UITableView!
    var name=""
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
        
    //FN field
    private let nameField: UITextField = {
        let field=UITextField()
        field.leftView=UIView(frame: CGRect(x:0,y:0,width:10,height:50))
        field.leftViewMode = .always
        field.placeholder="Name"
        field.backgroundColor = .lightGray
        field.layer.cornerRadius=8
        field.layer.masksToBounds=true
        field.frame = CGRect(x:40, y:350, width:250,height:30)
        return field
    }()

        private let SearchButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Search name", for: .normal )
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action:#selector(didTapSearch),for: .touchUpInside)
            button.frame=CGRect.init(x:40,y:400,width:250,height:30)
            return button
        }()
       




        override init (frame : CGRect) {
            super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
            self.backgroundColor = .white
            self.addSubview(backButton)
            tableView = UITableView(frame: CGRect(x: 0, y:100, width: 350, height:200))
            tableView.backgroundColor = .white
            tableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: "AnimalCell")
            tableView.dataSource = self
            tableView.delegate = self
            addSubview(homeButton)
            addSubview(nameField)
            addSubview(SearchButton)
    

            
            
          
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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
        
        
      
        
        @objc func closeWindow(sender : UIButton) {
            let alert = UIAlertController(title: "Are you sure?", message: "going back", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: {_ in DispatchQueue.main.async {
                
               let nextview=ManagerStockUIView()
               self.addSubview(nextview)
               self.bringSubviewToFront(nextview)
           }
            } ))
            if let viewController = self.window?.rootViewController   {                         viewController.present(alert, animated: true) {
            }
            }
                    
             
       }
    
    @objc func didTapSearch(sender : UIButton) {
        
        self.addSubview(tableView)
        
   }

    

}
