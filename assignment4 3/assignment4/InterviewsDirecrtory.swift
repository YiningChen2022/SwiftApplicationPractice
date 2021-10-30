//
//  InterviewsDirecrtory.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation
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
    public func updateInterview(Interview:Interview, Status:String){
        if (Status != ""){
            Interview.setStatus(status: Status)
        }
          
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
