//
//  File.swift
//  Algorithm
//
//  LV1. 성격 유형 검사하기
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let choices = choices.map{$0-4}
    var typeTest:[String:Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    var result = ["R", "C", "J", "A"] //타입별 사전 상 우선순위
    
    for (cIndex, choice) in choices.enumerated() {
        if choice < 0 { //비동의
            typeTest[String(survey[cIndex].first!)]! += abs(choice)
        }else if choice > 0 { //동의
            typeTest[String(survey[cIndex].last!)]! += choice
        }
    }
    
    //RT
    if typeTest["R"]! < typeTest["T"]! {
        result[0] = "T"
    }
    
    //CF
    if typeTest["C"]! < typeTest["F"]! {
        result[1] = "F"
    }
    
    //JM
    if typeTest["J"]! < typeTest["M"]! {
        result[2] = "M"
    }
    
    //AN
    if typeTest["A"]! < typeTest["N"]! {
        result[3] = "N"
    }
    
    return result.joined()
}

//print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))//"TCMA"
//
//print(solution(["TR", "RT", "TR"], [7, 1, 3])) //"RCJA"
