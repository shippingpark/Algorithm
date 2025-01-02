//
//  LV4. 행렬과연산.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/06.
//

import Foundation

//func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
//    var result:[[Int]] = []
//    var leftQ = Dequeue<Int>()
//    var midQ:[Dequeue<Int>] = []
//    var rightQ = Dequeue<Int>()
//
//    let lastIndex = rc[0].count - 1
//
//    for line in rc {
//        leftQ.addLast(line[0])
//        var innerQ = Dequeue<Int>()
//        for index in 1..<lastIndex {
//            innerQ.addLast(line[index])
//        }
//        midQ.append(innerQ)
//        rightQ.addLast(line[lastIndex])
//    }
//
//    for order in operations {
//        if order == "ShiftRow" {
//            guard let lastLeft = leftQ.popLast() else {continue}
//            let lastQ = midQ.removeLast()
//            guard let lastRight = rightQ.popLast() else {continue}
//            leftQ.addFirst(lastLeft)
//            midQ.insert(lastQ, at: 0)
//            rightQ.addFirst(lastRight)
//
//        } else {
//            guard let firstLeftQ = leftQ.popFirst() else {continue}
//            var Q = midQ.removeFirst()
//            Q.addFirst(firstLeftQ)
//            guard let lastMidQ = Q.popLast() else {continue}
//            midQ.insert(Q, at: 0)
//            rightQ.addFirst(lastMidQ)
//            guard let lastRightQ = rightQ.popLast() else {continue}
//            Q = midQ.removeLast()
//            Q.addLast(lastRightQ)
//            guard let firstMidQ = Q.popFirst() else {continue}
//            midQ.append(Q)
//            leftQ.addLast(firstMidQ)
//        }
//    }
//
//    var left = leftQ.toArray()
//    var mid = midQ.map{$0.toArray()}
//    var right = rightQ.toArray()
//
//    for index in mid.indices {
//        var line:[Int] = []
//        line.append(left[index])
//        line += mid[index]
//        line.append(right[index])
//        result.append(line)
//    }
//
//    return result
//}


// MARK: - 효율성 테스트 두 개 실패

func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
    var result:[[Int]] = []
    var leftQ = Dequeue<Int>()
    var midQ = Dequeue<Dequeue<Int>>()
    var rightQ = Dequeue<Int>()

    let lastIndex = rc[0].count - 1

    for line in rc {
        leftQ.addLast(line[0])
        var innerQ = Dequeue<Int>()
        for index in 1..<lastIndex {
            innerQ.addLast(line[index])
        }
        midQ.addLast(innerQ)
        rightQ.addLast(line[lastIndex])
    }

    for order in operations {
        if order == "ShiftRow" {
            guard let lastLeft = leftQ.popLast() else {continue}
            guard let lastQ = midQ.popLast() else {continue}
            guard let lastRight = rightQ.popLast() else {continue}
            leftQ.addFirst(lastLeft)
            midQ.addFirst(lastQ)
            rightQ.addFirst(lastRight)

        } else {
            guard let firstLeftQ = leftQ.popFirst() else {continue}
            var Q = midQ.popFirst()
            Q?.addFirst(firstLeftQ)
            guard let lastMidQ = Q?.popLast() else {continue}
            guard let Q1 = Q else {continue}
            midQ.addFirst(Q1)
            rightQ.addFirst(lastMidQ)
            guard let lastRightQ = rightQ.popLast() else {continue}
            Q = midQ.popLast()
            Q?.addLast(lastRightQ)
            guard let firstMidQ = Q?.popFirst() else {continue}
            guard let Q2 = Q else {continue}
            midQ.addLast(Q2)
            leftQ.addLast(firstMidQ)
        }
    }

    var left = leftQ.toArray()
    var mid = midQ.toArray()
    var right = rightQ.toArray()

    for index in mid.indices {
        var line:[Int] = []
        line.append(left[index] as! Int)
        line += mid[index] as! [Int]
        line.append(right[index] as! Int)
        result.append(line)
    }

    return result
}

//print(solution([[1, 2, 3], [4, 5, 6], [7, 8, 9]], ["Rotate"])) //[[8, 9, 6], [4, 1, 2], [7, 5, 3]]
//print(left)
//print(mid)
//print(right)
//print(leftQ.toArray())
//print(midQ.map{$0.toArray()})
//print(rightQ.toArray())
