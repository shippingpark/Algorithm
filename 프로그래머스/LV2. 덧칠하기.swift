//
//  LV2. 덧칠하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/26.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var count:Int = 0
    var paintIndex:Int = 0
    
    for sectionIndex in section {
        if paintIndex >= sectionIndex {
            continue
        } else {
            paintIndex = sectionIndex + m - 1
            count += 1
        }
    }
    return count
}


//func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
//    var paintArea:[Bool] = Array(repeating: true, count: n)
//
//    for i in section {
//        paintArea[i-1].toggle()
//    }
//
//    var paintLen:Int = 0
//    var index = section.first!
//    var count:Int = 0
//
//    while index != n {
//        guard paintLen == 0 else {
//            paintLen -= 1
//            paintArea[index] = true
//            index += 1
//            continue
//        }
//        if !paintArea[index] {
//            paintArea[index] = true
//            index += 1
//            paintLen = m - 1
//            count += 1
//        } else {
//            index += 1
//        }
//    }
//    return count
//}



