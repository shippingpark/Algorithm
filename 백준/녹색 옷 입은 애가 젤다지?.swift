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


// MARK: - 2 BFS
// 최단거리를 구하는데 유용한 BFS
// 방문 2차원 배열을 전부 Int.max로 채운 뒤
// 다음 경로가 다음 경로 맵 + 현재 경로 방문 보다 큰 지 판별하여 갱신해 주었다
// 만약 방문하지 않은 곳이라면 당연히 큰 값이 존재할 테니 갱신되고
// 만약 방문했더라면 최솟값이냐 아니냐에 따라 갱신된다 

var count = 0
while true {
  guard let N = Int(readLine()!), N != 0 else { break }
  
  let map = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
  var visit = map.map{ $0.map{ _ in Int.max } }
  visit[0][0] = map[0][0]

  let dr = [-1, 1, 0, 0]
  let dc = [0, 0, -1, 1]
  
  func bfs() -> Int {
    var Q = [(r: 0, c: 0)]
    var sum = 0
    
    while !Q.isEmpty {
      let (r, c) = Q.removeFirst()
      
      for i in 0..<4 {
        let (nr, nc) = (r + dr[i], c + dc[i])
        guard nr >= 0 && nr < N && nc >= 0 && nc < N else { continue }
        guard visit[nr][nc] > visit[r][c] + map[nr][nc] else { continue }
        visit[nr][nc] = visit[r][c] + map[nr][nc]
        Q.append( (nr, nc) )
      }
    }
    
    return visit[N-1][N-1]
  }
  count += 1
  print("Problem \(count): \(bfs())")
}


// MARK: - 3
// 최소 경로는 BFS
// 재방문이지만, 최소 경로를 찾아야 할 때에는 비교를 통해 갱신
// 아예 Viste을 Int.max로 생성하기

var count = 0
while true{
  guard let N = Int(readLine()!), N != 0 else { break }
  let map = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
  var visit = Array(repeating: Array(repeating: Int.max, count: N), count: N)
  visit[0][0] = map[0][0] // visit 만들 때 첫 구간은 누적되지 않으니 직접 초기화 해주기 (그래야 아래 로직상 문제가 없음)
  let dr = [-1, 1, 0, 0]
  let dc = [0, 0, -1, 1]
  var Q = [(r: 0, c: 0)]
  
  while !Q.isEmpty {
    let now = Q.removeFirst()
    for i in 0..<4 {
      let (nr, nc) = (now.r + dr[i], now.c + dc[i])
      guard nr >= 0 && nr < N && nc >= 0 && nc < N else { continue }
      if visit[nr][nc] > visit[now.r][now.c] + map[nr][nc] { // 새로운 값이 현재 누적보다 더 작다면
        visit[nr][nc] = visit[now.r][now.c] + map[nr][nc] // 갱신
        Q.append((nr, nc))
      }
    }
  }
  count += 1
  print("Problem \(count): \(visit[N-1][N-1])")
}
