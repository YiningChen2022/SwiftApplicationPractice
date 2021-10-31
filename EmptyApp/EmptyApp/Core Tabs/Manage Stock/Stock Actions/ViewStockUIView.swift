//
//  ViewStockUIView.swift
//  EmptyApp
//
//  Created by Yining Chen on 10/31/21.
//  Copyright © 2021 rab. All rights reserved.
//

import Foundation
import UIKit
class ViewStockUIView: UIView, UITableViewDelegate, UITableViewDataSource {
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
    
    private let SeachByCompanyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search By Company", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapSearchCompany),for: .touchUpInside)
        button.frame=CGRect.init(x:40,y:320,width:250,height:25)
        return button
    }()
    private let SeachByCategoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search By Category", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapSearchCategory),for: .touchUpInside)
        button.frame=CGRect.init(x:40,y:360,width:250,height:25)
        return button
    }()
    private let SeachByNameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search By Name", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapSearchName),for: .touchUpInside)
        button.frame=CGRect.init(x:40,y:400,width:250,height:25)
        return button
    }()
    private let SeachByFinancialRating: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search By FinancialRating", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapSearchFincial),for: .touchUpInside)
        button.frame=CGRect.init(x:40,y:440,width:250,height:25)
        return button
    }()
    private let SeachBytrade: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search By Last trade Price", for: .normal )
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(didTapSearchtrade),for: .touchUpInside)
        button.frame=CGRect.init(x:40,y:480,width:250,height:25)
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
        self.addSubview(tableView)
        addSubview(SeachBytrade)
        addSubview(SeachByCompanyButton)
        addSubview(SeachByNameButton)
        addSubview(SeachByCategoryButton)
        addSubview(SeachByFinancialRating)

        
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //Table View
    func tableView(_ tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        return (AppDelegate.GlobalVariable.stocklist.testStocklist.getsize())
      }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
      
          let cell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
       cell.textLabel?.text = AppDelegate.GlobalVariable.stocklist.testStocklist.toString()[indexPath.row]
          return (cell)
      }
    
    
  
    
    @objc func closeWindow(sender : UIButton) {
        let nextview=ManagerStockUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }
    @objc func didTapSearchCompany(sender : UIButton) {
        let nextview=SearchByCompanyUIView()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }
    
    @objc func didTapSearchCategory(sender : UIButton) {
        let nextview=SearchByCategory()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }

    @objc func didTapSearchName(sender : UIButton) {
        let nextview=SearchByName()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }
    @objc func didTapSearchFincial(sender : UIButton) {
        let nextview=SearchByFinancialRating()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }
    @objc func didTapSearchtrade(sender : UIButton) {
        let nextview=SearchByTrade()
        self.addSubview(nextview)
        self.bringSubviewToFront(nextview)
   }
    
}


