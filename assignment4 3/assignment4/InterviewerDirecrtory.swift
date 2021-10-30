//
//  InterviewerDirecrtory.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation
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
    
    public func updateInterviewerProfile(Interviewer:Interviewer, Name:String, Salary:Int?){
        if (Name != ""){
            Interviewer.setName(name: Name)
        }
            Interviewer.setSalary(salary: Salary)
    }
    public func validInterviewer(Id:String)->Bool{
        for interviewer in interviewList {
            if (interviewer.getUniqueId().uuidString.elementsEqual(Id)){
                return true;
            }
    }
        return false;
    }
    
    
    public func toString(){
        for interviewer in interviewList {
            print (interviewer.toString())
    }
}
}
