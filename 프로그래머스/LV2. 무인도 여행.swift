//
//  LV2. 무인도 여행.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/23.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    var N: Int = maps.count
    var M: Int = maps[0].count
    var maps: [[String]] = maps.map{ $0.map{ String($0) } }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
    var directionN: [Int] = [-1, 1, 0, 0]
    var directionM: [Int] = [0, 0, -1, 1]
    var count = 0
    
    func checkIsland(n: Int, m: Int) {
        guard n >= 0 && n < N && m >= 0 && m < M else { return }
        guard !visited[n][m] else { return }
        guard let num = Int(maps[n][m]) else { return }
        count += num
        visited[n][m] = true
        
        for i in 0..<4 {
            checkIsland(n: n + directionN[i], m: m + directionM[i])
        }
    }
    
    var result:[Int] = []
    
    for i in 0..<N {
        for j in 0..<M {
            count = 0
            checkIsland(n: i, m: j)
            if count != 0 {
                result.append(count)
            }
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
