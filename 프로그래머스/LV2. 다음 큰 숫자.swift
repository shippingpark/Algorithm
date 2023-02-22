//
//  LV2. 다음 큰 숫자.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/22.
//

import Foundation

// MARK: - 기존 풀이

//func solution(_ n:Int) -> Int {
//    var nRadixOneNum = String(n, radix: 2).replacingOccurrences(of: "0", with: "").count
//    var result = n
//
//    repeat {
//        result += 1
//    }
//    while String(result, radix: 2).replacingOccurrences(of: "0", with: "").count != nRadixOneNum
//
//    return result
//}


// MARK: - 수정 풀이
//func solution(_ n:Int) -> Int {
//    var nRadixOneNum = String(n, radix: 2).filter{$0 == "1"}.count
//    var result = n
//
//    repeat {
//        result += 1
//    }
//    while String(result, radix: 2).filter{$0 == "1"}.count != nRadixOneNum
//
//    return result
//}

// MARK: - 더 나은 풀이

//func solution(_ n:Int) -> Int {
//    var answer : Int = n + 1
//
//    while true {
//        if n.nonzeroBitCount == answer.nonzeroBitCount {
//            break;
//        }
//        answer += 1
//    }
//
//    return answer
//}

