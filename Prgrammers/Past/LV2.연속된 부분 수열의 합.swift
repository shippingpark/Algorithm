//
//  LV2.연속된 부분 수열의 합.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/04.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var result: [Int] = []
    var cal: Int = 0
    var start = 0
    
    main : for (last, num) in sequence.enumerated() {
        guard num != k else {result = [last, last]; break}
        
        cal += num

        if cal > k {
            while cal > k {
                guard start != last else {break main}
                let firstNum = sequence[start]
                cal -= firstNum
                start += 1
            }
        }
        
        if cal == k {
            if result.isEmpty {
                result = [start, last]
            } else {
                let len = last - start
                if len < result[1] - result[0] {
                    result = [start, last]
                }
            }
        }
    }
    
    return result
}

//func solution(_ sequence:[Int], _ k:Int) -> [Int] {
//    var 적립: [(Int, Int)] = []
//    var 새로: [(Int, Int)] = [] //결과값  [(인덱스, 값), (인덱스, 값)]  //[시작인덱스, 마감인덱스]
//    var cal: Int = 0
//    var start = 0
//    var last = 0
////[1, 2, 3, 4, 5] // 7
//    for (index, num) in sequence.enumerated() {
//        guard num != k else {적립 = [(index, num), (index, num)]; break}
//        guard num < k else {continue}
//
//        cal += num
//        새로.append((index,num))
//
//        if cal > k {
//            while cal > k {
//                let first = 새로.removeFirst()
//                cal -= first.1
//            }
//        }
//
//        if cal == k {
//            if 적립.isEmpty {
//                적립 = 새로
//            } else {
//                적립 = 적립.count <= 새로.count ? 적립 : 새로
//            }
//        }
//    }
//
//    return [적립.first!.0, 적립.last!.0]
//}

