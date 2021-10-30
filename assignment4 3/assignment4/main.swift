//
//  main.swift
//  assignment4
//
//  Created by Yining Chen on 10/14/21.
//

import Foundation





var end=false
let Adminlist = AdminDirecrtory(AdminList: Array())
let InterviewerList = InterviewerDirecrtory(interviewList: Array())
let InterviewList = InterviewsDirecrtory(interviewsList: Array())
while !end {
    print("select options below")
    print("1. Create a Admin")
    print("2. Update a Admin")
    print("3. Delete Admin")
    print("4. View All Admin")
    print("5. Manage Account")
    print("6. exit")
  
    let selected : String? = readLine()
    switch selected!{
    case "1":
        print("Input user Email id")
        let emailid : String? = readLine()
        print("Input Password id")
        let password : String? = readLine()
        let Admin1 = Admin(userEmailId: emailid!, password: password!)
        Adminlist.addAdminProfile(admin: Admin1)
        print("-----------------------admin added-------------------")
        Adminlist.toString()
    case "2":
        Adminlist.toString()
        print("select user id: ")
        let userid : String? = readLine()
        let curr=Adminlist.getAdmin(Id: Int(userid!)!)
        print("update Name (enter empty to skip): ")
        let updatename : String? = readLine()
        print("update password (enter empty to skip): ")
        let updatepassword : String? = readLine()
        Adminlist.updateAdminProfile(admin: curr, password: updatepassword!, email: updatename!)
        print("-----------------------admin updated -------------------")
        Adminlist.toString()
    case "3":
        Adminlist.toString()
        print("select user id to delete: ")
        let userid : String? = readLine()
        let curr=Adminlist.getAdmin(Id: Int(userid!)!)
        Adminlist.deleteAdminProfile(Id: Int(userid!)!)
        print("-----------------------admin deleted -------------------")
        Adminlist.toString()
    case "4":
        Adminlist.toString()
    case "5":
        print("Admin id:")
        let userid : String? = readLine()
        print("Admin password")
        let userpssword : String? = readLine()
        if (Adminlist.validAdmin(email: userid!, password: userpssword!)){
            managerAccount()
        }else {
            print("wroong email or password")
        }
      
    case "6":
        end=true
    default:
        print("invalid input")
    }
}

public func managerAccount (){
    var end=false
    while (!end){
        print("select options below")
        print("1. Add Interviewer profile")
        print("2. Update Interviewer profile")
        print("3. Delete Interviewer profile")
        print("4. View All Profiles")
        print("5. exit to upper level")
        let selected : String? = readLine()
        switch selected!{
        case "1":
            print("Input Interviewer Name ")
            let name : String? = readLine()
            print("Input Salary or enter empty for default")
            let salary  : String? = readLine()
            let interviewer1 = Interviewer(name: name!, salary: Int(salary!))
            InterviewerList.addInterviewerProfile(interviewer: interviewer1)
            print("-----------------------Interviewer added-------------------")
            InterviewerList.toString()
        case "2":
            InterviewerList.toString()
            print("select interviewer id: ")
            let userid : String? = readLine()
            let curr=InterviewerList.getInterviewer(uniqueId: userid!)
            print("update Name (enter empty to skip): ")
            let updatename : String? = readLine()
            print("update salary (enter empty to skip): ")
            let updateSalary : String? = readLine()
            
            InterviewerList.updateInterviewerProfile(Interviewer:curr , Name: updatename!, Salary: Int(updateSalary!))
            print("-----------------------Interviewer Updated-------------------")
            InterviewerList.toString()
        case "3":
            InterviewerList.toString()
            print("select Interview id to delete: ")
            let userid : String? = readLine()
           
            InterviewerList.deleteInterciewerProfile(uniqueId: userid!)
          
            print("----------------------Interviewer deleted -------------------")
            InterviewerList.toString()
        case "4":
            print("----------------------All Interviewer -------------------")
            InterviewerList.toString()
            print("---- Select User to view particular Interviewer;s profile ---")
            print("Interviewer id:")
            let userid : String? = readLine()
           
            if (InterviewerList.validInterviewer(Id: userid!)){
                let person=InterviewerList.getInterviewer(uniqueId: userid!)
                managerInterview(Interviewer: person)
                
            }else {
                print("wroong email or password")
            }
          
            
        case "5":
            end=true
        default:
            print("invalid input")
        }
    }

}
private func managerInterview(Interviewer:Interviewer){
    var end=false
    while (!end){
        print("select options below")
        print("1. Schedule Interview ")
        print("2. Update Interviewe")
        print("3. Delete Interviewe")
        print("4. View All Interview")
        print("5. exit to upper level")
        let selected : String? = readLine()
        switch selected!{
        case "1":
            let count=InterviewList.countInterviews(interviewer: Interviewer)
            print(count)
            if (count>6){
                print("alert limited has been reached")
            }else {
                print("Interview status:")
                let status : String? = readLine()
                let interview = Interview(status: status!, interviewer: Interviewer)
                InterviewList.addInterviews(Interview: interview)
            print("-----------------------Interview added-------------------")
            InterviewList.toString()
            }
        case "2":
            InterviewList.toString()
            print("select interview id: ")
            let userid : String? = readLine()
            let curr=InterviewList.getinterview(Id: Int(userid!)!)
            print("update Status:")
            let update : String? = readLine()
            InterviewList.updateInterview(Interview: curr, Status: update!)
            print("-----------------------Interview Updated-------------------")
            InterviewList.toString()
        case "3":
            InterviewList.toString()
            print("select Interview to delete: ")
            let userid : String? = readLine()
        
            InterviewList.deleteInterciew(Id: Int(userid!)!)
          
            print("----------------------Interview deleted -------------------")
            InterviewList.toString()
        case "4":
            print("----------------------All Interviews of that interviewer -------------------")
            InterviewList.toString(interviewer: Interviewer)
            
        case "5":
            end=true
        default:
            print("invalid input")
        }
    }

    
}
