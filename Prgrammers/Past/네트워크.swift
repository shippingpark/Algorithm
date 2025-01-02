//
//  네트워크.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/10.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited:[Bool] = Array(repeating: false, count: n)
    var count:Int = 0
    
    func dfs(now: Int) {
        guard !visited[now] else {return}
        
        visited[now] = true
        
        for j in 0..<n {
            if computers[now][j] == 1 {
                dfs(now: j)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(now: i)
            count += 1
        }
    }
    
    return count
}
