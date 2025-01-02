//
//  File.swift
//  Algorithm
//
//  LV1. K번째수
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for command in commands {
        let i = command[0]; let j = command[1]; let k = command[2];
        var sliceArr = array[i-1...j-1]
        result.append(sliceArr.sorted()[k-1])
    }
    
    return result
}

//print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))


