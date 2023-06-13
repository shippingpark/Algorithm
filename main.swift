//
//  main.swift
//  Created by 박혜운 on 2023/02/22.
//

import Foundation


let count: Int = Int(readLine()!)!

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    let result: Int = Int(input[0], radix: 2)! ^ Int(input[1], radix: 2)!
    print(String(result, radix: 2))
    print(String(result, radix: 2).reduce(0){ $0 + Int(String($1))! })
}

// MARK: - 문제 풀이
//
//var binggoMap: [[String]] = []
//var binggoIndex: [String:(Int, Int)] = [:]
//var callList: [String] = []
//
//for i in 0..<10 {
//    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
//    if 0..<5 ~= i {
//        binggoMap.append(input)
//        for j in 0..<5 {
//            binggoIndex[input[j]] = (i, j)
//        }
//    } else {
//        callList.append(contentsOf: input)
//    }
//}
//
//let direcR = [1, 0, 1, -1]
//let direcC = [0, 1, 1, 1]
//var count = 0
//
//main: for call in callList {
//    count += 1
//    let nowr = binggoIndex[call]!.0
//    let nowc = binggoIndex[call]!.1
//    binggoMap[nowr][nowc] = "0" //방문
//
//     var checkr = nowr
//     var checkc = nowc
//     var cycle = 0
//
//    for i in 0..<4 {
//        guard cycle != 3 else {print(count); break main}
//
//        checkc = 0
//        while i == 0 {
//            guard binggoMap[nowr][checkc] == "0" else {break}
//            checkc += 1
//            if checkc == 5 {
//                cycle += 1
//                break
//            }
//        }
//
//        checkr = 0
//        while i == 1 {
//            guard binggoMap[checkr][nowc] == "0" else {break}
//            checkr += 1
//            if checkr == 5 {
//                cycle += 1
//                break
//            }
//        }
//
//        checkc = 0
//        checkr = 0
//        while i == 2 {
//            guard binggoMap[checkr][checkc] == "0" else {break}
//            checkc += 1
//            checkr += 1
//            if checkc == 5 {
//                cycle += 1
//                break
//            }
//        }
//
//        checkc = 0
//        checkr = 4
//        while i == 3 {
//            guard binggoMap[checkr][checkc] == "0" else {continue NextDirection}
//            checkc += 1
//            checkr -= 1
//            if checkc == 5 {
//                cycle += 1
//                continue NextDirection
//            }
//        }
//    }
//}
//
//print(binggoMap)
//

