//
//  File2.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/21.
//

import Foundation


//func solution(_ s:String) -> [Int] {
//    var beforeTrans:[Character] = s.map{$0}
//    var countzero = 0
//    var countTrans = 0
//
//    while beforeTrans != ["1"] {
//        var removezero = beforeTrans.filter{$0 == "1"}
//        countzero += beforeTrans.count - removezero.count
//        beforeTrans = String(removezero.count, radix: 2).map{$0}
//        countTrans += 1
//    }
//
//    return [countTrans, countzero]
//}



// MARK: - replacingOccurrences 사용한 더 나은 풀이

func solution(_ s: String) -> Array<Int> {
    var copiedS = s
    var removedZero = 0
    var count = 0

    while copiedS != "1" {
        removedZero += copiedS.replacingOccurrences(of: "1", with: "").count
        copiedS = String(copiedS.replacingOccurrences(of: "0", with: "").count, radix: 2)
        count += 1
    }
    return [count, removedZero]
}
