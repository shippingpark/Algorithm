//
//  적록색약.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/08.
//

//import Foundation
//
//let N:Int = Int(readLine()!)!
//let rgbMap:[[String]] = {
//    var array:[[String]] = Array(repeating: [], count: N)
//    for i in 0..<N {
//        array[i] = readLine()!.map{String($0)}
//    }
//    return array
//}()
//let rbMap:[[String]] = rgbMap.map{$0.map{$0 == "G" ? "R" : $0}}
//
//let nr = [-1, 1, 0, 0]
//let nc = [0, 0, -1, 1]
//
//func colorArea(map: [[String]]) -> Int {
//    let compare:[[Bool]] = Array(repeating: Array(repeating: true, count: N), count: N)
//    var visited:[[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
//    var stack:[(r:Int, c:Int)] = []
//    var result = 0
//
//    while visited != compare {
//    findNode: for i in 0..<N {
//            for j in 0..<N {
//                if visited[i][j] == false {
//                    visited[i][j] = true
//                    stack.append((r:i, c:j))
//                    result += 1
//                    break findNode
//                }
//            }
//        }
//        while !stack.isEmpty {
//            let node = stack.removeFirst()
//
//            for i in 0..<4 {
//                let nr = node.r + nr[i]
//                let nc = node.c + nc[i]
//
//                guard nr >= 0 && nc >= 0 && nr < N && nc < N else {continue}
//                guard map[nr][nc] == map[node.r][node.c] else {continue}
//                guard !visited[nr][nc] else {continue}
//                visited[nr][nc] = true
//                stack.append((r: nr, c: nc))
//            }
//        }
//    }
//    return result
//}
//
//print("\(colorArea(map: rgbMap)) \(colorArea(map: rbMap))")
