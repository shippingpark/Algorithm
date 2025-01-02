//
//  입국심사.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/16.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var left: Int = 1
    var right: Int = 1_000_000_000 * n
    var mid: Int = 0
    
    func validTime(time: Int) -> Bool {
        var n = n
        for person in times {
            n -= (time / person)
        }
        return n <= 0
    }
    
    while left < right {
        mid = (left + right) / 2
        
        if validTime(time: mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
