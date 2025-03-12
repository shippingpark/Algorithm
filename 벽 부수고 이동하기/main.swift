//
//  main.swift
//  벽 부수고 이동하기
//
//  Created by 박혜운 on 3/12/25.
//

import Foundation

// 완전탐색 = N^2 = 10^6
// 이동하면서 벽 선택

let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let (N, M) = (input[0], input[1])
let graph: [[String]] = {
  var array: [[String]] = Array(repeating: [], count: N)
  for i in 0..<N {
    array[i] = readLine()!.map { String($0) }
  }
  return array
}()

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var stack = [(0, 0, false, 1)]
var visited = Array(repeating: Array(repeating: [false, false], count: M), count: N) // 벽 안 뚫고 방문, 뚫고 방문
visited[0][0][0] = true
var result = Int.max
var index = 0

while stack.count > index {
  let current = stack[index]
  if current.0 == N-1 && current.1 == M-1 {
    result = min(result, current.3)
    break
  }
  
  for i in 0..<4 {
    let (nx, ny, breakWall, count) = (current.0 + dx[i], current.1 + dy[i], current.2, current.3)
    guard nx >= 0 && nx < N && ny >= 0 && ny < M else { continue }
    
    if graph[nx][ny] == "1" { // 벽일 때
      if !visited[nx][ny][1] && !breakWall  { // 벽 뚫고 방문한 적 없고 이제껏 벽 뚫고 방문한 적 없으면
        visited[nx][ny][1] = true
        let new = (nx, ny, true, count + 1) // 벽 뚫고 방문
        stack.append(new)
      }
    }
    if graph[nx][ny] == "0" {
      if !visited[nx][ny][breakWall ? 1 : 0] { // 벽을 뚫은 적 없으면
        visited[nx][ny][breakWall ? 1 : 0] = true
        let new = (nx, ny, breakWall, count + 1)
        stack.append(new)
      }
    }
  }
  index += 1
}

print(result == Int.max ? -1 : result)
