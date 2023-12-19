//
//  녹색 옷 입은 애가 젤다지?.swift
//  Algorithm
//
//  Created by 박혜운 on 12/19/23.
//

import Foundation

// MARK: - 1 BFS

let MAX = 126
let INF = Int.max

var dx = [0, 0, 1, -1]
var dy = [1, -1, 0, 0]
var matrix = Array(repeating: Array(repeating: 0, count: MAX), count: MAX)
var visit = Array(repeating: Array(repeating: INF, count: MAX), count: MAX)

func initSet() {
  for i in 0..<MAX {
    matrix[i] = Array(repeating: 0, count: MAX)
  }
  for i in 0..<MAX {
    visit[i] = Array(repeating: INF, count: MAX)
  }
}

func BFS(_ N: Int) -> Int {
  var Q = [(Int, Int)]()
  visit[1][1] = matrix[1][1]
  Q.append((1, 1))
  while !Q.isEmpty {
    let (x, y) = Q.removeFirst()
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx > 0 && nx <= N && ny > 0 && ny <= N {
        if visit[nx][ny] > visit[x][y] + matrix[nx][ny] {
          visit[nx][ny] = visit[x][y] + matrix[nx][ny]
          Q.append((nx, ny))
        }
      }
    }
  }
  return visit[N][N]
}

var testCase = 1
while true {
  testCase += 1
  initSet()
  guard let N = Int(readLine() ?? ""), N != 0 else { break }
  for i in 1...N {
    let row = (readLine() ?? "").split(separator: " ").map { Int($0)! }
    for j in 1...N {
      matrix[i][j] = row[j - 1]
    }
  }
  let result = BFS(N)
  print("Problem \(testCase-1): \(result)")
}


// MARK: - 2 DP

