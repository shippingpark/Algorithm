//
//  main.swift
//  쉬운 계단 수
//
//  Created by 박혜운 on 3/12/25.
//

import Foundation

let n = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n+1)

for j in 1..<10 {
  dp[1][j] = 1
}

for i in 1...n {
  guard i != 1 else { continue }
  
  for j in 0..<10 {
    if j > 0 {
      dp[i][j] += dp[i-1][j-1] % 1_000_000_000
    }
    if j < 9 {
      dp[i][j] += dp[i-1][j+1] % 1_000_000_000
    }
    
    dp[i][j] %= 1_000_000_000
  }
}

var sum = 0

for i in 0..<10 {
  sum += dp[n][i] % 1_000_000_000
  sum %= 1_000_000_000
}

print(sum)
