//
//  File.swift
//  Algorithm
//
//  [1차] 다트 게임


import Foundation

func solution(_ dartResult:String) -> Int {
    var result:[Double] = []
    var count = 0 //연산 수
        
    for char in dartResult {
        switch char {
        case "S": count += 1
        case "D": result[result.endIndex-1] = pow(result[result.endIndex-1], 2); count += 1
        case "T": result[result.endIndex-1] = pow(result[result.endIndex-1], 3); count += 1
        case "*":
            result[result.endIndex-1] *= 2
            guard result.endIndex != 1 else {break}
            result[result.endIndex-2] *= 2
        case "#":
            result[result.endIndex-1] *= (-1)
        case "0": //count = 0 , 마지막 인덱스에 든 요소가 1 ==> 10
            if count != 0 {
                fallthrough
            }
            guard result.count != 0 else {fallthrough}
            
            result[result.endIndex-1] = 10.0
        default:
            result.append(Double(String(char))!)
            count = 0
        }
    }
    return Int(result.reduce(0){$0 + $1})
}

//print(solution("1S2D*3T"))
//print(solution("1D2S#10S"))
//print(solution("0D0S0T*"))
//print(solution("1D2S3T*"))

