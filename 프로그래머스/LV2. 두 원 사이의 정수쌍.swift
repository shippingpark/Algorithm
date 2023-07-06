//
//  LV2. 두 원 사이의 정수쌍.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/06.
//

import Foundation

func solution(_ r1: Int, _ r2: Int) -> Int64 {
    var answer = 0
    
    for i in 1..<r2 {
        if i < r1 {
            answer += getMaxY(i, r2, "r2") - getMaxY(i, r1, "r1")
        } else {
            answer += getMaxY(i, r2, "r2")
        }
    }
    
    answer *= 4
    answer += (r2 - r1 + 1) * 4
    
    return Int64(answer)
}

private func getMaxY(_ x: Int, _ r: Int, _ rName: String) -> Int {
    let max = sqrt(Double(r * r - x * x))
    let maxToInt = Int(max)
    
    if rName == "r1" && max - Double(maxToInt) == 0.0 {
        return maxToInt - 1
    } else {
        return maxToInt
    }
}
