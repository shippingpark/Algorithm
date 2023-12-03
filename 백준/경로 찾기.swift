//
//  경로 찾기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/02.
//

import Foundation

// MARK: - 1

// 그래프에 대한 개념이 부족하여 처음부터 학습하였다
// 아직 조금 헷갈리지만, 열이 노드, 행이 경로라는 것은 이해하였다
// 다시 풀 때 조금 나을 것 같다

let n = Int(readLine()!)!
let graph = (0..<n).map{ _ in readLine()!.split(separator: " ").map{ String($0) } }
var visited: [Bool] = Array(repeating: false, count: n)
var result: [[String]] = Array(repeating: Array(repeating: "0", count: n), count: n)

func dfs(start: Int, now: Int) {
  for i in 0..<n {
    if graph[now][i] == "1" && !visited[i] {
      result[start][i] = "1"
      visited[i] = true
      dfs(start: start, now: i)
    }
  }
}

for dot in 0..<n {
  dfs(start: dot, now: dot)
  visited = Array(repeating: false, count: n)
}

print(result.map{ $0.joined(separator: " ") }.joined(separator: "\n"))


// MARK: - 2 DFS
// 그래프에 대한 감을 찾고 있다
// 문제를 푸는 방법에 대해 이해하는 과정이다
// 모든 결과를 확인하므로 BFS보다 DFS로 풀어보고자 한다
// 의미를 변수로 두는 것 보다, 객관적인 지표인 Row, Col 이라고 두는 게 덜 헷갈림

let n = Int(readLine()!)!

let map = (0..<n).map{ _ in readLine()!.split(separator: " ") }
var result = Array(repeating: Array(repeating: "0", count: n), count: n)

func dfs(row: Int, col: Int) {
  for i in 0..<n {
    if map[col][i] == "1" && result[row][i] != "1" {
      result[row][i] = "1"
      dfs(row: row, col: i)
    }
  }
}


for i in 0..<n {
  dfs(row: i, col: i)
}

print(result.map{ $0.joined(separator: " ") }.joined(separator: "\n"))


// MARK: - 3 BFS

// MARK: - 4 플로이드-와샬



