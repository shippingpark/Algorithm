//
//  평범한 배낭.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/09.
//

import Foundation

struct Goods {
    let weight: Int
    let cost: Int
}

func solution() {
    let input:[Int] = (readLine()?.split(separator: " ").compactMap({ Int($0) }))!
    let N = input[0]
    let K = input[1]

    var goodsList: [Goods] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: K + 1), count: N + 1)

    for _ in 0..<N {
        let line:[Int] = (readLine()?.split(separator: " ").compactMap({ Int($0) }))!
        let w = line[0]
        let c = line[1]

        goodsList.append(Goods(weight: w, cost: c))
    }

    for i in 1...N {//가치
        let now = goodsList[i - 1] //goodsList의 길이가 N이므로 인덱스 기준 호출, goodsList[i-1]과 dp[i] 높이 같음
        for j in 0...K { //최대로 담을 수 있는 무게
            dp[i][j] = dp[i - 1][j]
            if now.weight <= j {
                dp[i][j] = max(dp[i][j], now.cost + dp[i - 1][j - now.weight])
            }
        }
    }

    print(dp[N][K])
}

solution()
