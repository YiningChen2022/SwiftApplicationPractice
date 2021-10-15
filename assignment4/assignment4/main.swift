//
//  main.swift
//  assignment4
//
//  Created by Yining Chen on 10/14/21.
//

import Foundation

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
    var uniqueId:UUID
    var salary:Int?=nil
    init(name: String, salary:Int){
        self.name=name
        self.uniqueId=UUID()
        self.salary=salary
        
    }
    
    public func getName()->String{
        return name
    }
    public func getUniqueId()->UUID{
        return uniqueId
    }
    public func getsalary()->Int?{
        return salary
    }
    public func setName(name: String){
        self.name=name
    }
    public func setUniqueId(uniqueId: UUID){
        self.uniqueId=uniqueId
    }
    public func setSalary(salary: Int?){
        self.salary=salary
    }
    public func toString()->String {
              return "\(uniqueId) \(name) \(salary!)";
          }
}

class InterviewerDirecrtory {
    var interviewList: [Interviewer]
    init(interviewList:Array<Interviewer>){
        self.interviewList = []
    }
    
    public func getInterviewer(uniqueId: String)->Interviewer{
        var curr:Interviewer?
        for interviewer in interviewList {
            if interviewer.getUniqueId().uuidString.elementsEqual(uniqueId){
                curr=interviewer
            }
        }
        return curr!
    }

    
    
    

    
//1. Add Interviewer profile - Name, Unique id, Salary (default salary is nil )
    public func addInterviewerProfile(name: String, salary: Int?){
        let Interviewer = Interviewer(name: name,salary: salary!)
        interviewList.append(Interviewer)
    }
    public func deleteInterciewerProfile(uniqueId: String){
                for (index, value) in interviewList.enumerated() {
                    if value.uniqueId.uuidString.elementsEqual(uniqueId) {
                        interviewList.remove(at: index)
                    }
            }
    }
    public func toString(){
        for interviewer in interviewList {
            print (interviewer.toString())
    }
}
}

class Interview {
    var status:String
    var interviewer: Interviewer
    init(status: String, interviewer:Interviewer){
        self.interviewer=interviewer
        self.status=status
    }
    public func getStatus()->String{
        return status
    }
    public func setStatus(status: String){
        self.status=status
    }
}


class InterviewsDirecrtory {
    var interviewsList: [Interview]
    init(interviewsList:Array<Interview>){
        self.interviewsList = []
    }
}
    

//Testing
let list1=InterviewerDirecrtory(interviewList:Array())
list1.addInterviewerProfile(name:"JasonJason", salary: 100000)
list1.addInterviewerProfile(name:"MaryMary", salary:120000)
list1.addInterviewerProfile(name:"AmyAmy", salary:110000)
list1.addInterviewerProfile(name:"JennyJenny", salary:110000)

/*let manager = Admin(userEmailId: "hello@gmail.com", password: "password")
print("Manager or Admin Email?:")
let email : String? = readLine()
print("Please enter Password")
let password : String? = readLine()

if manager.userEmailId==email && manager.password==password {
 */
    print("select options below")
    print("1. Add Interviewer profile")
    print("2. Delete Interviewer profile")
    print("3. Update Interviewer profile")
    print("4. View All Profiles")


    let selected : String? = readLine()
switch selected!{
case "1":
    print("please enter interviewer's name")
    let name : String? = readLine()
    print("please enter interviewer's salary")
    let salary : String? = readLine()
    _ = Interviewer(name: name!, salary: Int(salary!)!)
    list1.addInterviewerProfile(name: name!, salary: Int(salary!)!)
case "2":
    print("\(list1.toString())")
    print("please enter the UniqueId to Delete interviewer:")
    let id: String? = readLine()
    list1.deleteInterciewerProfile(uniqueId:id!)
    print("---------------Interviewer deleted----------------------")
    print("\(list1.toString())")
    
case "3":
    print("\(list1.toString())")
    print("please enter the UniqueId to Update interviewer:")
    let id: String? = readLine()
    let current=list1.getInterviewer(uniqueId: id!)
    print("Do you want to update interview's name? Y/N")
    let ans: String? = readLine()
    if ans=="Y"{
        print("please enter updated name")
        let updateName: String? = readLine()
        current.setName(name: updateName!)
    }else{
        print("please enter updated salary")
        let updatesalary: String? = readLine()
        current.setName(name: updatesalary!)
    }
    print("---------------Interviewer Updated----------------------")
    print("\(list1.toString())")
case "4":
    list1.toString()
    print("Provide interviewer's uniqueId to get their interviews' information: ")
    let selectedInterviewer: String? = readLine()
    let current=list1.getInterviewer(uniqueId: selectedInterviewer!)
    print("select options below")
    print("A. Scheduled Interviews ")
    print("B. All Interviews")
    print("C. Add Interviews")

    let selected1 : String? = readLine()
    switch selected1!{
    case "A":
        print("input invalided")
    case "B":
        print("input invalided")
    case "C":
        print("input invalided")
    default:
        print("input invalided")
    
    
default:
    print("input invalided")
}
        
   
//}


    

