//
//  스티커.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/09.
//

//import Foundation
//
//let T = Int(readLine()!)!
//
//for _ in 0..<T {
//    let n = Int(readLine()!)!
//
//    var sticker: [[Int]] = Array(repeating: [], count: 2) //위치 == 인덱스로 세주기 위한 빈값 삽입
//    for i in 0..<2 {
//        let scores = readLine()!.split(separator: " ").map { Int(String($0))! }
//        sticker[i] = [0] + scores
//    }
//
//    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: 2)
//    //내 위치 기준 좌측 판단 위한 초기값 설정
//    dp[0][1] = sticker[0][1]
//    dp[1][1] = sticker[1][1]
//
//    if n >= 2 {
//        for i in 2...n {
//            dp[0][i] = sticker[0][i] + max(dp[1][i-1], dp[1][i-2])
//            dp[1][i] = sticker[1][i] + max(dp[0][i-1], dp[0][i-2])
//        }
//    }
//
//    print(max(dp[0].last!, dp[1].last!))
//}
