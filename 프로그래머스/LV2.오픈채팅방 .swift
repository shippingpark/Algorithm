//
//  LV2.오픈채팅방 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/04.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    var userInfo: [String: String] = [:]
    for log in record {
        let logComponents = log.components(separatedBy: " ")
        let action = logComponents[0]
        let userId = logComponents[1]
        
        if action == "Enter" || action == "Change" {
            let userName = logComponents[2]
            userInfo[userId] = userName
        }
    }
    
    for log in record {
        let logComponents = log.components(separatedBy: " ")
        let action = logComponents[0]
        let userId = logComponents[1]
        
        if let userName = userInfo[userId] {
            switch action {
            case "Enter":
                result.append("\(userName)님이 들어왔습니다.")
            case "Leave":
                result.append("\(userName)님이 나갔습니다.")
            default:
                continue
            }
        }
        
        if action == "Change" {
            print("호호")
        }
    }
    return result
}


// MARK: - 시간초과

//func solution(_ record:[String]) -> [String] {
//    var result:[String] = []
//    var feedInfo = record.map{$0.components(separatedBy: " ")}
//    var userId:Set<String> = Set(feedInfo.map{$0[1]})
//
//    var userInfo:[String:String] = {
//        var dic:[String:String] = [:]
//        for id in userId {
//            var idfeed = feedInfo.filter{$0[1] == id && $0[0] != "Leave"}
//            dic[id] = idfeed.last?[2]
//        }
//        return dic
//    }()
//
//    for feed in feedInfo {
//        let title = feed[0]
//        let name = userInfo[feed[1]]!
//        guard title != "Change" else {continue}
//        switch title {
//        case "Enter": result.append("\(name)님이 들어왔습니다.")
//        default: result.append("\(name)님이 나갔습니다.")
//        }
//    }
//    return result
//}

//print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234"]))

