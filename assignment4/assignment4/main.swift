//
//  main.swift
//  assignment4
//
//  Created by Yining Chen on 10/14/21.
//

import Foundation

print("Hello, World!")

//Develop a Command Line Swift Program to replicate a simple “Recruiting Firm” account management.
//The program needs the following input data:


//A. Get Started: Admin or Account manager1. User email id  2. Password
class Admin {
  var  userEmailId: Int
  var  password: Int
    init(userEmailId: Int, password: Int) {
        self.userEmailId=userEmailId
        self.password=password
    }
    
    
//B. Manage Account: should be shown if email and password exist
    //1. Add Interviewer profile - Name, Unique id, Salary (default salary is nil )

    //2. Delete Interviewer profile
    //3. Update Interviewer profile
    //4. View All Profiles

}
