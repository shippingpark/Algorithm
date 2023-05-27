//
//  LV1. 소수 만들기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/26.
//

import Foundation

// MARK: - 백트래킹 풀이
func solution(_ nums:[Int]) -> Int {
    let fullCount = nums.count
    var sum = 0
    var result = 0

    func backtracking(sum: Int = 0, start: Int = 0, count: Int = 0) {
        guard count < 3 else {
            if isPrime(sum) {
                result += 1
            }
            return
        }
        
        for i in start..<fullCount {
            backtracking(sum: sum + nums[i], start: i + 1, count: count + 1)
        }
    }
    backtracking()

    return result
}

print(solution([1, 2, 3, 4]))


// MARK: - 3중 포문 풀이

func isPrime(_ num: Int) -> Bool {
    guard num != 1 else {return false}
    guard num > 3 else {return true}
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }

    return true
}

func solution(_ nums:[Int]) -> Int {
    let count = nums.count
    var sum = 0
    var result = 0
    
    for i in 0..<count-2 {
        for j in (i+1)..<count-1 {
            for k in (j+1)..<count {
                sum = nums[i] + nums[j] + nums[k]
                if isPrime(sum) {
                    result += 1
                }
            }
        }
    }

    return result
}
