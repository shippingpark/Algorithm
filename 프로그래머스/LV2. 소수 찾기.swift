//
//  LV2. 소수 찾기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/24.
//

import Foundation


func solution(_ numbers: String) -> Int {
    var count = 0
    var set = Set<Int>()
    let numArray = Array(numbers)
    var visited = Array(repeating: false, count: numbers.count)
    
    func backtracking(current: String) {
        if current != "" {
            if let num = Int(current), !set.contains(num) && isPrime(num: num) {
                set.insert(num)
            }
        }
        
        for i in 0..<numArray.count {
            if !visited[i] {
                visited[i] = true
                backtracking(current: current + String(numArray[i]))
                visited[i] = false
            }
        }
    }
    
    backtracking(current: "")
    
    return set.count
}

func isPrime(num: Int) -> Bool {
    if num == 0 {
        return false
    }
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}
