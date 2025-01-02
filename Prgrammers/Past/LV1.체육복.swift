//
//  File.swift
//  Algorithm
//
//  체육복
//

import Foundation


//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//
//    var clothList = Array(repeating: 1, count: n)
//
//    for i in reserve {
//        clothList[i-1] += 1
//    }
//
//    for j in lost {
//        clothList[j-1] -= 1
//    }
//
//    for (index, num) in clothList.enumerated() {
//        guard num == 0 else {continue}
//        if index != 0 && clothList[index-1] == 2 {
//            clothList[index-1] -= 1
//            clothList[index] += 1
//            continue
//        }
//
//        if index != n-1 && clothList[index+1] == 2 {
//            clothList[index+1] -= 1
//            clothList[index] += 1
//        }
//    }
//    return clothList.filter{$0>0}.count
//}


//print(solution(5, [2, 4], [1, 3, 5]))


func solution(_ numbers:[Int]) -> [Int] {
    var setArr = Set<Int>()
    for i in numbers {
        let num = numbers.remove(at: numbers.firstIndex(of: i)!)
        for j in numbers {
            setArr.insert(i + j)
        }
    }
    
    return setArr.map{$0}.sorted(by: <)
}
