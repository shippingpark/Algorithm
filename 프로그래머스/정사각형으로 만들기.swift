//
//  정사각형으로 만들기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/04.
//

import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    let n = arr.count
    let m = arr[0].count
    if n == m {
        return arr
    } else if n > m {
        var plusM = Array(repeating: 0, count: n-m)
        return arr.map{ $0 + plusM }
    } else {
        var result = arr
        var plusN = Array(repeating: 0, count: m)
        for _ in 0..<(m-n) {
            result.append(plusN)
        }
        return result
    }
}
