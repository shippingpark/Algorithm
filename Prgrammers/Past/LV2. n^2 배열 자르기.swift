//
//  LV2. n^2 배열 자르기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/15.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (Int(left)...Int(right)).map{ ($0 / n >= $0 % n) ? ($0 / n) : ($0 % n) }.map{$0 + 1}
}
