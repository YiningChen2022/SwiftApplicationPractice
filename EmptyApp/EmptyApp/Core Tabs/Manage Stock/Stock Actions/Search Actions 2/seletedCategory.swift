//
//  seletedCategory.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class SelectedCategory : UIView, UITableViewDelegate, UITableViewDataSource {
        var tableView:UITableView!
        //back button
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
            self.backgroundColor = .white
            self.addSubview(backButton)
            tableView = UITableView(frame: CGRect(x: 0, y:100, width: 350, height:500))
            tableView.backgroundColor = .white
            tableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: "AnimalCell")
            tableView.dataSource = self
            tableView.delegate = self
            self.addSubview(tableView)
            addSubview(homeButton)
           
            
            
          
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        //Table View
        func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
            
            return (AppDelegate.GlobalVariable.stocklist.testStocklist.searchCategorygetsize(categoryid: AppDelegate.GlobalVariable.selectedCategorySearch))
          }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
          
              let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
           cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.searchByCategory(categoryid: AppDelegate.GlobalVariable.selectedCategorySearch)[indexPath.row]
              return (cell)
          }
        
        
      
        
        @objc func closeWindow(sender : UIButton) {
            let nextview=ManagerStockUIView()
            self.addSubview(nextview)
            self.bringSubviewToFront(nextview)
       }
      
    
}




