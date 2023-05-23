//
//  쉬운 최단거리.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/08.
//

import Foundation
//
//let input:[Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
//let n:Int = input[0]
//let m:Int = input[1]
//var start = (n:0, m:0)
//
//let map: [[Int]] = {
//    var array:[[Int]] = Array(repeating: [], count: n)
//    for i in 0..<n {
//        array[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//        guard let j = array[i].firstIndex(of: 2) else {continue}
//        start = (n: i, m: j)
//        }
//    return array
//}()
//
//var result: [[Int]] = {
//    var array = Array(repeating: Array(repeating: -1, count: m), count: n)
//    for i in 0..<n {
//        array[i] = map[i].map{$0 == 0 ? 0 : -1}
//    }
//    return array
//}()
//
//let ny = [-1, 1, 0, 0]
//let nx = [0, 0, -1, 1]
//
//var stack = [start]
//result[start.n][start.m] = 0
//
//while !stack.isEmpty {
//    let node = stack.removeFirst()
//
//    for i in 0..<4 {
//        let nn = node.n + ny[i]
//        let nm = node.m + nx[i]
//
//        guard nn >= 0 && nm >= 0 && nn < n && nm < m else {continue}
//        guard result[nn][nm] == -1 else {continue}
//
//        result[nn][nm] = result[node.n][node.m] + 1
//        stack.append((n: nn, m: nm))
//    }
//}
//
//func printResult(_ resultMap:[[Int]]) {
//    for line in resultMap {
//        print(line.map{String($0)}.joined(separator: " "))
//    }
//}
//
//printResult(result)


