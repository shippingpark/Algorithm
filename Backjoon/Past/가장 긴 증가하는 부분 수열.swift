//
//  가장 긴 증가하는 부분 수열.swift
//  Algorithm
//
//  Created by 박혜운 on 12/29/23.
//

import Foundation

// MARK: - 1
// DP

let n = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp: [Int] = []

for i in 0..<n {
    dp.append(1)
    for j in 0..<i+1 {
        if A[j] < A[i] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(dp.max()!)



