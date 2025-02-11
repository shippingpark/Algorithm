//
//  main.swift
//  집합의 표현
//
//  Created by 박혜운 on 2/11/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var parent: [Int] = Array(0...N) // parent[i] = j // i노드의 부모는 j노드

func find(_ x: Int) -> Int { // 부모 찾기
  if x == parent[x] {
    return x
  }
  parent[x] = find(parent[x]) // 경로 압축
  return parent[x]
}

func union(_ a: Int, _ b: Int) {
  let roota = find(a)
  let rootb = find(b)
  parent[rootb] = roota
}

for _ in (0..<M) {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let (a, b) = (input[1], input[2])
  if input[0] == 0 {
    union(a, b)
  } else {
    print(find(a) == find(b) ? "YES" : "NO")
  }
}

//7 8
//0 1 3
//1 1 7
//0 7 6
//1 7 1
//0 3 7
//0 4 2
//0 1 1
//1 1 1
