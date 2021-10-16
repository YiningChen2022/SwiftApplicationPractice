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
/*------------------------------------------------------------------
--------------------------------------------------------------------*/
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
/*------------------------------------------------------------------
--------------------------------------------------------------------*/
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
/*------------------------------------------------------------------
--------------------------------------------------------------------*/
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
    public func addInterviewerProfile(interviewer: Interviewer){
        interviewList.append(interviewer)
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
/*------------------------------------------------------------------
--------------------------------------------------------------------*/
class Interview {
    static var nextUid:Int = 0
    static func generateUid() -> Int {
         nextUid+=1
        return nextUid
    }
    var status:String
    var interviewer: Interviewer
    let uid: Int
  
    init(status: String, interviewer:Interviewer){
        self.interviewer=interviewer
        self.status=status
        self.uid = Interview.generateUid()
    }
    public func getStatus()->String{
        return status
    }
    public func setStatus(status: String){
        self.status=status
    }
    public func getInterviewer()->Interviewer{
        return interviewer
    }
    public func setInterviewer(Interviewer: Interviewer){
        self.interviewer=Interviewer
    }
    public func getuid()->Int{
        return uid
    }
    
    public func toString()->String {
        return "\(uid) \(interviewer.uniqueId) \(interviewer.name) + \(status)";
          }
}

/*------------------------------------------------------------------
--------------------------------------------------------------------*/
class InterviewsDirecrtory {
    var interviewsList: [Interview]
    init(interviewsList:Array<Interview>){
        self.interviewsList = []
    }
    public func addInterviews(Interview :Interview){
        interviewsList.append( Interview )
    }
    public func getinterview (Id:Int)->Interview{
        var inter:Interview?
        for interview in interviewsList{
            if interview.getuid()==Id{
                inter = interview
            }
        }
        return inter!
    }
    

    public func deleteInterciew(Id: Int){
                for (index, value) in interviewsList.enumerated() {
                    if value.uid==Id {
                        interviewsList.remove(at: index)
                    }
            }
    }
    public func countInterviews(interviewer:Interviewer)->Int{
        var count:Int=0
        for interview in interviewsList {
            if interview.getInterviewer().getUniqueId()==interviewer.getUniqueId(){
                count+=1
            }
        }
        return count
    }
    
    
    
    public func toString(interviewer:Interviewer){
        for interview in interviewsList {
            if interview.getInterviewer().getUniqueId()==interviewer.getUniqueId(){
                print (interview.toString())
            }
    }
    }
        public func toString(){
            for interview in interviewsList {
               
                    print (interview.toString())
                }
        }
        

}
    
/*------------------------------------------------------------------
--------------------------------------------------------------------*/
//Testing
let person1 = Interviewer(name:"JasonJason", salary: 100000)
let person2 = Interviewer(name:"MaryMary", salary:120000)
let person3 = Interviewer(name:"AmyAmy", salary:110000)
let person4 = Interviewer(name:"JennyJenny", salary:110000)
let list1=InterviewerDirecrtory(interviewList:Array())
list1.addInterviewerProfile(interviewer: person1 )
list1.addInterviewerProfile(interviewer: person2 )
list1.addInterviewerProfile(interviewer: person3)
list1.addInterviewerProfile(interviewer: person4)
let interviewlist = InterviewsDirecrtory(interviewsList: Array())


let Int1=Interview(status: "Processing", interviewer: person1)
let Int2=Interview(status: "Processing", interviewer: person1)
let Int9=Interview(status: "Processing", interviewer: person1)
let Int10=Interview(status: "Processing", interviewer: person1)
let Int11=Interview(status: "Processing", interviewer: person1)
let Int12=Interview(status: "Processing", interviewer: person1)
let Int3=Interview(status: "Processing", interviewer: person2)
let Int4=Interview(status: "Processing", interviewer: person2)
let Int5=Interview(status: "Processing", interviewer: person3)
let Int6=Interview(status: "Processing", interviewer: person3)
let Int7=Interview(status: "Processing", interviewer: person3)
let Int8=Interview(status: "Processing", interviewer: person4)
interviewlist.addInterviews(Interview: Int1)
interviewlist.addInterviews(Interview: Int2)
interviewlist.addInterviews(Interview: Int3)
interviewlist.addInterviews(Interview: Int4)
interviewlist.addInterviews(Interview: Int5)
interviewlist.addInterviews(Interview: Int6)
interviewlist.addInterviews(Interview: Int7)
interviewlist.addInterviews(Interview: Int8)
interviewlist.addInterviews(Interview: Int9)
interviewlist.addInterviews(Interview: Int10)
interviewlist.addInterviews(Interview: Int11)
interviewlist.addInterviews(Interview: Int12)
let manager = Admin(userEmailId: "hello@gmail.com", password: "password")
print("Manager or Admin Email?:")
let email : String? = readLine()
print("Please enter Password")
let password : String? = readLine()

if manager.userEmailId==email && manager.password==password {
 
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
    let curr = Interviewer(name: name!, salary: Int(salary!)!)
    list1.addInterviewerProfile(interviewer: curr)
    print("Person Added")
    list1.toString()
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
    print("B. All Interviews for this user ")
    print("C. Add Interviews")

    let selected1 : String? = readLine()
    if selected1=="A"||selected1=="a"{
        interviewlist.toString()
    }else if selected1=="B"||selected1=="b"{
        interviewlist.toString(interviewer: current)
        
    }else if selected1=="C"||selected1=="c"{
        let count = interviewlist.countInterviews(interviewer: current)
        if count>=6{
            print("warning! Scheduled Interviews exceed 6")
        }else{
            
     
        //1. Add a new Interview in Scheduled Interview List
       let newinterview = Interview(status: "Processing", interviewer: current)
        interviewlist.addInterviews(Interview: newinterview)
        let id = newinterview.getuid()
        //2. Update the status of Scheduled Interview to Completed
        interviewlist.getinterview(Id: id).setStatus(status: "Complete")
        //3. Display all the Interviews
        print("---------------Display all Interciews before remove----------------------")
        interviewlist.toString(interviewer: current)
        interviewlist.deleteInterciew(Id: id)
        print("---------------Display all Interciews after remove----------------------")
        interviewlist.toString(interviewer: current)
        }
    }else {
        print("input invalid")
        
        
    }
        
     
default:
    print("input invalid")
}
        
}else {
    print("wrong email or password")
}


    

