//
//  내리막길.swift
//  Algorithm
//
//  Created by 박혜운 on 12/20/23.
//

import Foundation

// MARK: - 1
// 처음 bfs로 풀고 큰 코 다침...
// bfs는 최단 경로를 찾기엔 좋지만
// 중복해서 탐색해야 할 때는 불리하다
// 나는 점점 퍼져가면서 답을 구할 생각이었지만 이런식으로 구현하면
// 방문 처리를 할 수 없어진다
// 따라서 dfs + dp로 풀어야 한다

let input = readLine()!.split(separator: " ").map{ Int($0)! },
M = input[0], N = input[1] // 세로가 M 가로가 N (M, N)

var dp = Array(repeating: Array(repeating: -1, count: N), count: M)
// 각 지점에 도달하는 경로의 수
let map = (0..<M).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
// 현재 위치에서 목적지까지 도달하는 경로의 수를 계산
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func dfs(y: Int = 0, x: Int = 0) -> Int {
  if (y, x) == (y: M-1,x: N-1) { return 1 } // 목적지에 도달했다면 1 반환
  if dp[y][x] != -1 { return dp[y][x] } // 방문한 적 있는 곳이라면 방문 횟수 반환
  
  dp[y][x] = 0 // 방문 처리
  
  for i in 0..<4 {
    let (ny, nx) = (y + dy[i], x + dx[i])
    guard ny >= 0 && ny < M && nx >= 0 && nx < N else { continue }
    guard map[ny][nx] < map[y][x] else { continue } // 다음 위치가 더 낮다면
    dp[y][x] += dfs(y: ny, x: nx) // 현재 위치 경로 수에 다음 위치가 만든 경로 수를 더함
  }
  
  return dp[y][x] // 반환
}

print(dfs())

// MARK: - 2
// 가능한 모든 경로를 구하는 문제이므로 BFS로 풀면 안됌
// DFS로 풀어야 함
// 하지만 DFS로만 풀면 M, N 이 너무 커서 모두 탐색하기엔 부담이 됌
// 따라서 값을 누적해 가는 DP 와 함께 풀이

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

let map = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
var dp = Array(repeating: Array(repeating: -1, count: M), count: N)
let rd = [-1, 1, 0, 0]
let cd = [0, 0, -1, 1]

func dfs(_ r: Int = 0, _ c: Int = 0) -> Int {
  if (r, c) == (N-1, M-1) {
    return 1
  }
  
  if dp[r][c] != -1 { // 방문한 적이 있다면 방문 횟수 반환
    return dp[r][c]
  }
  
  dp[r][c] = 0
  
  for i in 0..<4 {
    let (rn, cn) = (r + rd[i], c + cd[i])
    guard rn >= 0 && rn < N && cn >= 0 && cn < M else { continue }
    if map[rn][cn] < map[r][c] {
      dp[r][c] += dfs(rn, cn) // 앞선 경로가 얼마나 많은 성공 가짓수를 가졌는 지 더한다
    }
  }
  return dp[r][c]
}

print(dfs())
