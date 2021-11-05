//
//  UpdateCategoryUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class UpdateCategoryUIView: UIView,UITableViewDelegate,UITableViewDataSource {
    var tableView:UITableView!
     
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
    
    
     //header
     private let label: UILabel = {
         let label = UILabel()
         label.textAlignment = .center
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 20, weight: .medium)
         label.text = "Select Category to update"
         return label
     }()

     
    override init (frame : CGRect) {
        super.init(frame :  CGRect(x:0, y: 0, width: 350, height: 600))
        backgroundColor = .white
        self.addSubview(backButton)
        self.addSubview(label)
        tableView = UITableView(frame: CGRect(x: 0, y:100, width: 350, height:500))
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "AnimalCell")
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(homeButton)
        self.addSubview(tableView)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
         let nextview=UpdateDetailCategoryUIView()
         self.addSubview(nextview)
         self.bringSubviewToFront(nextview)
        }
       
        
   
        }
    
    
    @objc func closeWindow(sender : UIButton) {
        let nextview=ManagerCategoryUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }

}
