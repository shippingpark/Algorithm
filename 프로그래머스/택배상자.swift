//
//  택배상자.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/21.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    var order: [Int] = order.reversed()
    var rail: [Int] = Array(1...order.count).reversed()
    var sub: [Int] = []
    var result: Int = 0
    
    while !order.isEmpty {
        let needOrder = order.last!
        
        if let nowBoxOrder = rail.last, nowBoxOrder == needOrder {
            rail.removeLast()
            order.removeLast()
            result += 1
        } else if let subOrder = sub.last, subOrder == needOrder {
            sub.removeLast()
            order.removeLast()
            result += 1
        } else {
            if let nowBoxOrder = rail.popLast() {
                sub.append(nowBoxOrder)
            } else {
                break
            }
        }
    }
    return result
}
