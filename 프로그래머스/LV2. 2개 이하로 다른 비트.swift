//
//  LV2. 2개 이하로 다른 비트.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/13.
//

import Foundation

// MARK: - 비트 연산

func solution(_ numbers: [Int64]) -> [Int64] {
    return numbers.map(minBit)
}

func minBit(_ number: Int64) -> Int64 {
    return (number | (~number & (number + 1))) & ~((~number & (number + 1)) >> 1)
}


// MARK: - 수학적 접근

//func solution(_ numbers:[Int64]) -> [Int] {
//    var result: [Int] = []
//
//    for number in numbers {
//        var cal: Int = Int(number)
//
//        var i = 0
//
//        while cal > 0 {
//            if cal == (cal / 2) * 2 {
//                break
//            }
//            cal /= 2
//            i += 1
//        }
//
//        if i == 0 { //number == 2 && number == 0
//            result.append(Int(number) + 1)
//        } else {
//            result.append(Int(number) + Int(pow(2.0, Double(i))) - Int(pow(2.0, Double(i-1))))
//        }
//    }
//
//    return result
//}

