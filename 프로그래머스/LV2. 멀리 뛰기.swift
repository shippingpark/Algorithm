//
//  LV2.멀리 뛰기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/06.
//

import Foundation

// MARK: - 피보나치수열

func solution(_ n:Int) -> Int {
    var arr = [1, 2]
    while arr.count < n {arr.append((arr[arr.count-1]+arr[arr.count-2])%1234567)}
    return arr[n-1]
}

// MARK: - 코어 덤프

//func solution(_ n:Int) -> Int {
//    var count2 = n/2
//    var count1 = n - 2 * count2
//    var result = 1 //전부 1 일 때
//
//    while count1 != n {
//        result += (factorial(num: count2 + count1)/(factorial(num: count1) * factorial(num: count2)))%1234567
//        count2 -= 1
//        count1 = n - 2 * count2
//    }
//    return result
//}
//
//func factorial(num: Int) -> Int {
//    if num < 2 { return 1 }
//    return factorial(num: num-1) * num
//}
