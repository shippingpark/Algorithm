//
//  File.swift
//  Algorithm
//
//  LV1. 개인정보 수집 유효기간
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayDate = today.components(separatedBy: ".").map{Int($0)!}
    let termsDic:[String: Int] = {
        let terms = terms.map{$0.components(separatedBy: " ")}
        var Diction:[String: Int] = Dictionary()
        for i in terms {
            Diction[i[0]] = Int(i[1])!
        }
        return Diction
    }()
    let privacies = privacies.map{ $0.components(separatedBy: " ")}
    
    var i = 1
    var result:[Int] = []
    
    for privacy in privacies {
        let userDate:[String] = (privacy.first?.components(separatedBy: "."))!
        let userPass = privacy.last!
        let userTerm = termsDic[userPass]!
        var userD = Int(userDate[2])! - 1
        var userM = Int(userDate[1])! + userTerm
        var userY = Int(userDate[0])!

        if userD == 0 {
            userD = 28
            userM -= 1
        }
        
        if userM > 12 {
            let quotient = userM / 12
            let remainder = userM % 12
            userM -= remainder != 0 ? 12 * quotient : 12 * (quotient - 1)
            userY += remainder != 0 ? quotient : quotient - 1
        }
        
        switch (userY, userM, userD) {
        case (userY, _, _) where userY > todayDate[0]:
            break
        case (userY, _, _) where userY < todayDate[0]:
            result.append(i)
        case (_, userM, _) where userM > todayDate[1]:
            break
        case (_, userM, _) where userM < todayDate[1]:
            result.append(i)
        case (_, _, userD) where userD >= todayDate[2]:
            break
        default:
            result.append(i)
        }
        i += 1
    }
    return result
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
//[1, 3]


