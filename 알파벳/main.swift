//
//  main.swift
//  알파벳
//
//  Created by 박혜운 on 3/12/25.
//

// MARK: - 미완
import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (R, C) = (input[0], input[1])
var graph: [[Int]] = Array(repeating: [], count: R)
for i in 0..<R {
  let input = readLine()!.map { Int($0.asciiValue!) - 65 }
  graph[i] = input
}

var visitedAlpabet = 1 << graph[0][0]
var result = 0

func dfs(_ cr: Int, _ cc: Int, _ visitedAlpabet: Int, count: Int) {
  result = max(result, count)

  for (nc, nr) in [(cr+1, cc), (cr-1, cc), (cr, cc+1), (cr, cc-1)] {
      guard 0..<R ~= nr && 0..<C ~= nc else { continue }
      guard (visitedAlpabet & 1 << graph[nr][nc]) == 0 else { continue }

      dfs(nc, nr, visitedAlpabet | 1 << graph[nr][nc], count: count+1)
  }
}

dfs(0, 0, visitedAlpabet, count: 1)

print(result)
