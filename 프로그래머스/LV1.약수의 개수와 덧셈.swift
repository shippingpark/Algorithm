//
//  LV1.약수의 개수와 덧셈.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/20.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0

    for num in left...right {
        result += measureCount(num: num) % 2 == 0 ? num : -num
    }
    return result
}

func measureCount(num: Int) -> Int {
    var count = 0

    for i in 1...num {
        if num % i == 0 {
            count += 1
        }
    }
    return count
}
