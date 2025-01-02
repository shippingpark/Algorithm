//
//  Lv2. 숫자 변환하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/25.
//

import Foundation

// MARK: - DP

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    var dp = [Int](repeating: Int.max, count: y + 1)
    dp[x] = 0
    
    for i in x..<y {
        if dp[i] == Int.max { continue }
        
        let next = i + n
        if next <= y {
            dp[next] = min(dp[next], dp[i] + 1)
        }
        
        let next2 = i * 2
        if next2 <= y {
            dp[next2] = min(dp[next2], dp[i] + 1)
        }
        
        let next3 = i * 3
        if next3 <= y {
            dp[next3] = min(dp[next3], dp[i] + 1)
        }
    }
    
    return dp[y] == Int.max ? -1 : dp[y]
}



// MARK: - BFS : 시간초과
//
//func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
//    var result = Set<Int>()
//    guard x != y else {return 0}
//
//    func dfs(num:Int, count:Int) {
//        guard num != y else {result.insert(count); return}
//        guard num < y else {return}
//
//
//        for cal in 0...2 {
//            switch cal {
//            case 0: dfs(num: num + n, count: count + 1)
//            case 1: dfs(num: num * 2, count: count + 1);
//            default: dfs(num: num * 3, count: count + 1)
//            }
//        }
//    }
//
//    dfs(num: x, count: 0)
//
//    return result.min() ?? -1
//}


// MARK: - DFS 시간초과

//func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
//    var result = Set<Int>()
//    guard x != y else {return 0}
//
//    func dfs(num:Int, count:Int) {
//        guard num != y else {result.insert(count); return}
//        guard num < y else {return}
//
//        for cal in 0...2 {
//            switch cal {
//            case 0: dfs(num: num + n, count: count + 1)
//            case 1: dfs(num: num * 2, count: count + 1);
//            default: dfs(num: num * 3, count: count + 1)
//            }
//        }
//    }
//
//    dfs(num: x, count: 0)
//
//    return result.min() ?? -1
//}

//print(solution(10, 40, 5))
