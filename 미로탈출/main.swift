//
//  main.swift
//  미로탈출
//
//  Created by 박혜운 on 2/6/25.
//

import Foundation

func solution_미로탈출(_ maps: [String]) -> Int {
  let map = maps.map { Array($0) }
  let n = map.count
  let m = map[0].count
  let dx = [1, -1, 0, 0]
  let dy = [0, 0, 1, -1]
  
  guard let (sx, sy) = findIndex(s: "S", n: n, m: m, map: map) else { return -1 }
  guard let (lx, ly) = findIndex(s: "L", n: n, m: m, map: map) else { return -1 }
  
  var sQueue = [(sx, sy, 0)]
  var sTolCount = Int.max
  var sTolVisit = Array(repeating: Array(repeating: false, count: m), count: n)
  sTolVisit[sx][sy] = true
  
  while !sQueue.isEmpty {
    let now = sQueue.removeFirst()
    
    if map[now.0][now.1] == "L" {
      sTolCount = min(sTolCount, now.2)
      continue
    }
    
    for i in 0..<4 {
      let (nx, ny) = (now.0 + dx[i], now.1 + dy[i])
      guard nx >= 0 && nx < n && ny >= 0 && ny < m else { continue }
      guard map[nx][ny] != "X" else { continue }
      guard !sTolVisit[nx][ny] else { continue }

      sTolVisit[nx][ny] = true
      sQueue.append((nx, ny, now.2+1))
    }
  }

  if sTolCount == Int.max { return -1 }
  
  var lQueue = [(lx, ly, 0)]
  var lToeCount = Int.max
  var lToeVisit = Array(repeating: Array(repeating: false, count: m), count: n)
  lToeVisit[lx][ly] = true
  
  while !lQueue.isEmpty {
    let now = lQueue.removeFirst()
    
    if map[now.0][now.1] == "E" {
      lToeCount = min(lToeCount, now.2)
      continue
    }
    
    for i in 0..<4 {
      let (nx, ny) = (now.0 + dx[i], now.1 + dy[i])
      guard nx >= 0 && nx < n && ny >= 0 && ny < m else { continue }
      guard map[nx][ny] != "X" else { continue }
      guard !lToeVisit[nx][ny] else { continue }
      lToeVisit[nx][ny] = true
      lQueue.append((nx, ny, now.2+1))
    }
  }
  
  if lToeCount == Int.max { return -1 }
  
  return sTolCount + lToeCount
}

func findIndex(s: Character, n: Int, m: Int, map: [[Character]]) -> (Int, Int)? {
  for x in 0..<n {
    for y in 0..<m {
      if map[x][y] == s {
        return (x, y)
      }
    }
  }
  return nil
}

