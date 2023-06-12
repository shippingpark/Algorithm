//
//  배열의 유사도.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/12.
//

import Foundation

func solution(_ s1:[String], _ s2:[String]) -> Int {
    return (0..<s1.count).map{ s2.contains(s1[$0]) ? 1 : 0 }.reduce(0, +)
}
