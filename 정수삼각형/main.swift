//
//  main.swift
//  정수삼각형
//
//  Created by 박혜운 on 2/7/25.
//

import Foundation

func solution_정수삼각형(_ n: Int, _ tree: [[Int]]) -> Int {
  guard n > 1 else { return tree[0][0] }
  
  var tmp = Array(repeating: Array(repeating: 0, count: n), count: n)
  tmp[0][0] = tree[0][0]
  
  for x in 0..<(n-1) {
    for y in 0..<x+1 {
      let now = tmp[x][y]
      tmp[x+1][y] = max(tmp[x+1][y], now + tree[x+1][y])
      tmp[x+1][y+1] = max(tmp[x+1][y+1], now + tree[x+1][y+1])
    }
  }
  
  return tmp[n-1].max() ?? tree[0][0]
}

let n = Int(readLine()!)!
let tree = (0..<n).map { _ in readLine()!.components(separatedBy: " ").map { Int(String($0))! } }
print(solution_정수삼각형(n, tree))
