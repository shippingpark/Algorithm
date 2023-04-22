//
//  LV2.기능 개발.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/22.
//

import Foundation


func solution(progresses:[Int], _ speeds:[Int]) -> [Int] {
    var stack = zip(progresses, speeds).reversed()
    var result:[Int] = []
    var days:Int = 0
    
    while !stack.isEmpty {
        let progressSpeed = stack.popLast()!
        if progressSpeed.0 + progressSpeed.1 * days >= 100 {
            result[result.count-1] += 1
        } else {
            result.append(1)
            days += Int(ceil(Double(100-progressSpeed.0-progressSpeed.1 * days) / Double(progressSpeed.1)))
            
        }
    }
    return result
}
