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


// MARK: - 3 DFS
// 아직도 제대로 이해 못함
// 확인하고자 하는 Node가 row 이고, 그 row에 해당하는 col들을 순회하며 (i) 접근 가능한 지 확인
// 일단 방문한 적 없고, 접근 가능하다면 map[row][i] == "1"
// 이전에 해당 노드를 방문했었는 지 확인하고, result[row][i] != "1"
// 방문하지 않았다면, 이동 가능하다고 표시 result[row][i] == "1" 하고
// 해당 i 값을 col로 두고, 다음 노드(col)를 통해 또 어디로 갈 수 있는 지 확인
// col은 어떤 노드에서의 경로를 확인할 지를 의미하고
// i는 해당 노드가 접근하는 0..<N의 경로를 훑는다
// row는 현재 어떤 노드를 검사하고 있는 지를 의미한다

let N = Int(readLine()!)!
let map = (0..<N).map{ _ in readLine()!.split(separator: " ") }
var result = Array(repeating: Array(repeating: "0", count: N), count: N)

func dfs(row: Int, col: Int) { // 해당 노드에 대한
  for i in 0..<N {
    if map[col][i] == "1" && result[row][i] != "1" { // 방문 처리 반드시 해 주어야 함
      result[row][i] = "1"
      dfs(row: row, col: i)
    }
  }
}

for i in 0..<N {
  dfs(row: i, col: i)
}

print(result.map{ $0.joined(separator: " ") }.joined(separator: "\n"))

// MARK: - 4

let N = Int(readLine()!)!
let map = (0..<N).map{ _ in readLine()!.split(separator: " ") }
var result = Array(repeating: Array(repeating: "0", count: N), count: N)

func dfs(node: Int, check: Int) {
  for i in 0..<N {
    if map[check][i] == "1" && result[node][i] != "1" {
      result[node][i] = "1"
      dfs(node: node, check: i)
    }
  }
}

for i in 0..<N {
  dfs(node: i, check: i)
}

print(result.map{ $0.joined(separator: " ") }.joined(separator: "\n"))




// MARK: - 5 플로이드-와샬



