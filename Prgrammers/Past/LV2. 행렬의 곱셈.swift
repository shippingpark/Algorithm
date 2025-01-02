//
//  LV2. 행렬의 곱셈.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/10.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr2.first!.count), count: arr1.count)
    for i in arr1.indices {
        for j in arr2.indices {
            for k in arr2.first!.indices {
                result[i][k] += arr1[i][j] * arr2[j][k]
            }
        }
    }
    return result
}
