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


//A. Get Started: Admin or Account manager 1. User email id  2. Password
class Admin {
  var  userEmailId: String
  var  password: String
    init(userEmailId:String, password: String ) {
        self.userEmailId=userEmailId
        self.password=password
    }
    public func getUserEmailId()->String{
        return userEmailId
    }
    public func setUserEmailId(userEmailId:String){
        self.userEmailId=userEmailId
    }
    public func getPassword()->String {
        return password
    }
    public func setPassword(password :String){
        self.password=password
    }
}

//B. Manage Account: should be shown if email and password exist
    //1. Add Interviewer profile - Name, Unique id, Salary (default salary is nil )

    //2. Delete Interviewer profile
    //3. Update Interviewer profile
    //4. View All Profiles

class Interviewer{
    var name: String
    var uniqueId:Int
    var salary:Int?=nil
    var count=1;
    init(name: String, salary:Int){
        self.name=name
        self.uniqueId=count
        self.salary=salary
        self.count+=1
        
    }
    
    public func getName()->String{
        return name
    }
    public func getUniqueId()->Int{
        return uniqueId
    }
    public func getsalary()->Int?{
        return salary
    }
    public func setName(name: String){
        self.name=name
    }
    public func setUniqueId(uniqueId: Int){
        self.uniqueId=uniqueId
    }
    public func setSalary(salary: Int?){
        self.salary=salary
    }
    public func toString()->String {
              return "\(uniqueId)\(name)\(salary!)";
          }
}

class InterviewDirecrtory {
    var interviewList: [Interviewer]
    init(interviewList:Array<Interviewer>){
        self.interviewList = []
    }
    
    public func getInterviewers()->Array<Interviewer>{
        return interviewList
    }
    
    
//1. Add Interviewer profile - Name, Unique id, Salary (default salary is nil )
    public func addInterviewerProfile(name: String, salary: Int?)->Interviewer{
        let Interviewer = Interviewer(name: name,salary: salary!)
        interviewList.append(Interviewer)
        return Interviewer
    }
    public func toString(){
        for interviewer in interviewList {
            print (interviewer.toString())
    }
}
}

//Testing
let list1=InterviewDirecrtory(interviewList:Array())
/*let manager = Admin(userEmailId: "hello@gmail.com", password: "password")
print("Manager or Admin Email?:")
let email : String? = readLine()
print("Please enter Password")
let password : String? = readLine()

if manager.userEmailId==email && manager.password==password {
 */
    print("select options below")
    print("1. Add Interviewr profile")
    let selected : String? = readLine()
    if selected=="1"{
        print("please enter interviewer's name")
        let name : String? = readLine()
        print("please enter interviewer's salary")
        let salary : String? = readLine()
        
        _ = Interviewer(name: name!, salary: Int(salary!)!)
       
        list1.addInterviewerProfile(name: name!, salary: Int(salary!)!)
        
       
       
    }
        
   
//}
list1.toString()

    

