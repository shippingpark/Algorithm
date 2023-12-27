//
//  동전.swift
//  Algorithm
//
//  Created by 박혜운 on 12/22/23.
//

import Foundation

// MARK: - 1
// 시간초과 문제로 DP 로 풀어야 한다 

//let n = Int(readLine()!)!
//for _ in 0..<n {
//  let type = Int(readLine()!)!
//  let papers = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: >)
//  let goalMoney = Int(readLine()!)!
//  var result = 0
//
//  func dfs(idx: Int = 0, temp: Int = goalMoney) {
//    if idx == type - 1 {
//      result += temp % papers[idx] == 0 ? 1 : 0
//      return
//    } else {
//      var temp2 = temp
//      while temp2 >= 0 {
//        dfs(idx: idx + 1, temp: temp2)
//        temp2 -= papers[idx]
//      }
//    }
//  }
//
//  dfs()
//  print(result)
//}
let n = Int(readLine()!)!
for _ in 0..<n {
  let type = Int(readLine()!)!
  let papers = readLine()!.split(separator: " ").map{ Int($0)! }
  let goalMoney = Int(readLine()!)!
  var dp = Array(repeating: 0, count: goalMoney+1)
  dp[0] = 1

  for i in papers {
    if i > goalMoney { continue }
    for j in i...goalMoney {
      dp[j] += dp[j-i]
    }
  }
  
  print(dp[goalMoney])
}


// MARK: - 2

let T = Int(readLine()!)!
for _ in 0..<T {
  let N = Int(readLine()!)!
  let coin = readLine()!.split(separator: " ").map{ Int($0)! }
  let M = Int(readLine()!)!
  var dp = Array(repeating: 0, count: M+1)
  dp[0] = 1
  
  for i in coin {
    guard i <= M else { continue }
    for j in i...M {
      dp[j] += dp[j-i]
    }
  }
  
  print(dp[M])
}



// MARK: - 3
let n = Int(readLine()!)!

for _ in 0..<n {
  let typeCount = Int(readLine()!)!
  let M = readLine()!.split(separator: " ").map{ Int($0)! }
  let money = Int(readLine()!)!
  var dp = Array(repeating: 0, count: money + 1)
  dp[0] = 1
  
  for m in M {
    guard m <= money else { continue }
    for j in m...money {
      dp[j] += dp[j-m]
    }
  }
  print(dp[money])
}

// MARK: - 4

let T = Int(readLine()!)!

for _ in 0..<T {
  let N = Int(readLine()!)!
  let MCase = readLine()!.split(separator: " ").map{ Int($0)! }
  let M = Int(readLine()!)!
  var dp = Array(repeating: 0, count: M+1)
  dp[0] = 1 // 0원을 만드는 가짓수는 1개
  
  for m in MCase {
    guard m <= M else { continue }
    for j in m...M {
      dp[j] += dp[j-m]
    }
  }
  print(dp[M])
}

