//
//  숫자 정사각형.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/10.
//

// MARK: - 뭌 풀이
let I = readLine()!.split {$0==" "}.map {Int($0)!},
    N = I[0],
    M = I[1]
var arr = (0..<N).map { _ in Array(readLine()!).map {Int(String($0))!}}
var result = 1

if N == 1 || M == 1 {
    print(1)
} else {
    for size in 1..<min(N,M) {
        for y in 0..<N-size {
            for x in 0..<M-size {
                let p1 = arr[y][x]
                let p2 = arr[y][x+size]
                let p3 = arr[y+size][x]
                let p4 = arr[y+size][x+size]
                
                if p1 == p2 && p2 == p3 && p3 == p4 {
                    result = (size+1)*(size+1)
                }
            }
        }
    }
    print(result)
}

// MARK: - 실패코드

//let input = readLine()!.split(separator: " ").compactMap{ Int($0) },
//N = input[0],
//M = input[1]
//
//let map = (0..<N).map{ _ in Array(readLine()!) }
//var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
//var result = 1
//
//for n in 0..<(N-1) {
//  for m in 0..<(M-1) {
//    guard visited[n][m] == false else { continue }
//
//    let leftTop = map[n][m]
//    visited[n][m] = true
//
//    for right in (m+1)..<M { //우 상단
//      guard visited[n][right] == false else { continue }
//      guard leftTop == map[n][right] else { continue }
//      visited[n][right] = true
//
//      for left in (n+1)..<N { //좌 하단
//        guard visited[left][m] == false else { continue }
//        guard leftTop == map[left][m] else { continue }
//        visited[left][m] = true
//        guard leftTop == map[left][right]  else { continue }
//        visited[left][right] = true
//        print(left, right)
//        result = max(result, (right - m + 1) * (left - n + 1) )
//      }
//    }
//  }
//}
//
//print(result)
