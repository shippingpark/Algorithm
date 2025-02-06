//
//  main.swift
//  2667
//
//  Created by 박혜운 on 2/6/25.
//

import Foundation

func solution(_ N: Int, _ map: [[Character]]) -> [Int] {
  var visit = Array(repeating: Array(repeating: false, count: N), count: N)
  var complexCount: Int = 0
  var housesInComplex: [Int] = []
  let rx = [1, -1, 0, 0]
  let ry = [0, 0, 1, -1]
  
  for x in 0..<N {
    for y in 0..<N {
      guard map[x][y] != "0" else { continue }
      guard visit[x][y] != true else { continue }
      complexCount += 1
      
      var stack = [(x, y)]
      var houseCount = 1
      visit[x][y] = true
      
      while !stack.isEmpty {
        let now = stack.removeLast()
        for i in 0..<4 {
          let (nx, ny) = (now.0 + rx[i], now.1 + ry[i])
          guard nx >= 0 && nx < N && ny >= 0 && ny < N else { continue }
          guard map[nx][ny] == "1" else { continue }
          guard !visit[nx][ny] else { continue }
          visit[nx][ny] = true
          houseCount += 1
          stack.append((nx, ny))
        }
      }
      housesInComplex.append(houseCount)
    }
  }
  
  return [complexCount] + housesInComplex.sorted()
}

let n = Int(readLine()!)!
let map: [[Character]] = (0..<n).map { _ in Array(readLine()!.replacingOccurrences(of: " ", with: "")) }

solution(n, map).forEach { print($0) }

