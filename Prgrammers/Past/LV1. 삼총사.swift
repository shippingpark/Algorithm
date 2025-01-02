//
//  LV1. 삼총사.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/23.
//

import Foundation

func solution(_ number:[Int]) -> Int {
    var result = 0
    
    func combination(index: Int, sum: Int, count: Int) {
        if count == 3 {
            if sum == 0 {
                result += 1
            }
            return
        }
        
        for i in index..<(number.count) {
            combination(index: i+1, sum: sum + number[i], count: count + 1)
        }
    }
    
    combination(index: 0, sum: 0, count: 0)
    
    return result
}
