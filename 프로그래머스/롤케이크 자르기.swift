//
//  롤케이크 자르기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/15.
//

import Foundation


func solution(_ topping:[Int]) -> Int {
    var leftCakeSet = Set<Int>()
    var rightCakeSet = Set<Int>()
    var leftCake:[Int] = []
    var rightCake:[Int] = []
    var result = 0
    
    
    for leftTopping in topping {
        leftCakeSet.insert(leftTopping)
        leftCake.append(leftCakeSet.count)
    }
    
    for rightTopping in topping.reversed() {
        rightCakeSet.insert(rightTopping)
        rightCake.append(rightCakeSet.count)
    }
    
    rightCake.reverse()
    
    for i in 0..<(topping.count-1) {
        if leftCake[i] == rightCake[i+1] {
            result += 1
        }
    }
    
    return result
}
