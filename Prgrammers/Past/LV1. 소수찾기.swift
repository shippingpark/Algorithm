//
//  LV1. 소수찾기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/21.
//
import Foundation

func solution(_ n:Int) -> Int {
    var count = 0
    for i in 1...n {
        if i.isPrime() {
            count += 1
        }
    }
    
    return count
}

extension Int {
    func isPrime() -> Bool {
        guard self > 1 else {return false}
        guard self > 3 else {return true}
        
        for num in 2...Int(sqrt(Double(self))) {
            if self % num == 0 {
                return false
            }
        }
        return true
    }
}
