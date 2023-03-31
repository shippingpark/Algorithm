//
//  LV2.[3차] n진수 게임 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/31.
//

import Foundation

// MARK: - 개선 된 풀이 : 하지만 시간 초과 풀이와의 차이점은 잘 모르겠다. 공부 필요
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var wholeNumber = ""
    var result = ""
    
    for i in 0..<(m * t) {
        let num = String(i, radix: n)
        wholeNumber += num
    }
    
    let wholeNumberArray = wholeNumber.map{String($0)}
    
    for i in 0..<wholeNumberArray.count {
        if result.count == t {
            break
        }
        let index = m * i + (p - 1)
        result += wholeNumberArray[index].uppercased()
    }
    return result
}

// MARK: - 시간초과

//func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
//    var order = 1
//    var result = ""
//    var store = "0"
//
//    repeat {
//        store += String(order, radix: n, uppercase: true)
//        order += 1
//    } while store.count < m * (t - 1) + p
//
//    let firstIndex = store.startIndex
//    for i in 0..<t {
//        result.append(Array(store)[(i*m) + (p-1)])
//    }
//
//    return result
//}
