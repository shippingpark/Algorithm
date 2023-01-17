//
//  File.swift
//  Algorithm
//
//  LV1.푸드 파이트 대회

//

import Foundation

// MARK: - 처음 풀이
func solution(_ food:[Int]) -> String {
    var result:String = ""
    
    for (i, a) in food.enumerated() {
        guard a != 1 else {continue}
        result += Array(repeating: "\(i)", count: a/2).joined()
        for _ in 1...a/2 {
            result += String(i)
        }
    }

    var clone = result
    result += "0"

    while !clone.isEmpty {
        result += String(clone.popLast()!)
    }
    
    return result
}

// MARK: - 개선 풀이

func solution(_ food:[Int]) -> String {
    var resultL:String = ""
    var resultR:String = ""
    
    for (i, a) in food.enumerated() {
        guard a != 1 else {continue}
        resultL += Array(repeating: "\(i)", count: a/2).joined()
        resultR.insert(contentsOf: Array(repeating: "\(i)", count: a/2).joined(), at: resultR.startIndex)
    }
    
    return resultL + "0" + resultR
}


print(solution([1, 3, 4, 6])) //"1223330333221"
print(solution([1, 7, 1, 2])) //"111303111"
