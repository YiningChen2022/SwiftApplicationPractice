//
//  Interview.swift
//  assignment4
//
//  Created by Yining Chen on 10/29/21.
//

import Foundation
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
