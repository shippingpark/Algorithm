//
//  LV2. 가장 큰 수.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/20.
//

import Foundation

// MARK: - 시간초과 발생 A 풀이

func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
    let result = sortedNumbers.joined()

    if result.first == "0" {
        return "0"
    }
    
    return result
}
        

// MARK: - 시간초과 해결 B 풀이

func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }

    let answer = sortedNumbers.map { String($0) }.reduce("") { $0 + $1 }
    return sortedNumbers.first == 0 ? "0" : answer
}

// MARK: - 시간초과 개선 A-1 풀이
func solution(_ numbers: [Int]) -> String {
    let sortedNumbers = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    let result = sortedNumbers.map { String($0) }.joined()

    if result.first == "0" {
        return "0"
    }

    return result
}


print(solution([6, 2, 20])) //"6210"
