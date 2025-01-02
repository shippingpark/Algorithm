//
//  바닥 장식.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0],
M = input[1]

var room:[[Character]] = []
var count: Int = 0

for _ in 0..<N {
  let line = readLine()!.map{ Character(extendedGraphemeClusterLiteral: $0) }
  room.append(line)
  var 중복: Bool = false
  for c in 0..<M {
    guard line[c] != "-" || !중복 else { continue }
    if line[c] == "-" {
      중복 = true
      count += 1
    } else {
      중복 = false
    }
  }
}

for c in 0..<M {
  var 중복: Bool = false
  for r in 0..<N {
    guard room[r][c] != "|" || !중복 else { continue }
    if room[r][c] == "|" {
      중복 = true
      count += 1
    } else {
      중복 = false
    }
  }
}

print(count)

// MARK: - 무커 코드

//let NM = readLine()!.split {$0 == " "}.map {Int($0)!}, N = NM[0], M = NM[1]
//let arr = (0..<N).map { _ in Array(readLine()!) } //한 번에 Line 받아오는 코드
//var visited = Array(repeating: Array(repeating: false, count: M), count: N)
//var result = 0
//
//for i in 0..<N {
//    for j in 0..<M {
//        guard !visited[i][j] else { continue }
//        var d = 1
//        visited[i][j] = true
//        result += 1
//        if arr[i][j] == "-" {
//            while j+d < M && arr[i][j+d] == "-" {
//                visited[i][j+d] = true
//                d += 1
//            }
//        } else {
//            while i+d < N && arr[i+d][j] == "|" {
//                visited[i+d][j] = true
//                d += 1
//            }
//        }
//    }
//}
//print(result)
