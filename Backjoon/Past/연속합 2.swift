//
//  연속합 2.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/15.
//

import Foundation

func solution() {
    guard let input = Int(readLine()!) else {return}
    guard let read = readLine()?.split(separator: " ").compactMap({Int(String($0))}) else {return}
    
    var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: input)
    var result = read.first!
    dp[0][0] = read.first!
    dp[0][1] = read.first!
    

    for i in 1..<input {
        dp[i][0] = max(dp[i-1][0]+read[i], read[i])
        dp[i][1] = max(dp[i-1][1]+read[i], dp[i-1][0])
        let 비교 = max(dp[i][0], dp[i][1])
        result = max(result, 비교)
    }
    
    print(result)
}

solution()
