//
//  Lv1.행렬의 덧셈.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/30.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map { zip($0, $1).map { $0 + $1 } }
}
