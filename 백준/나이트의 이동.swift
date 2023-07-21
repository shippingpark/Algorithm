//
//  나이트의 이동.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/21.
//

import Foundation

let repeatInput = Int(readLine()!)!

let dr = [2, -2, 1, -1, 2, -2, 1, -1]
let dc = [-1, -1, -2, -2, 1, 1, 2, 2]

for _ in 0..<repeatInput { //input case
    var stateInput:[Int] = []
    for _ in 0..<3 { //횟수
      let input: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
      stateInput.append(contentsOf: input)
    }
  
    let (l, startP, finishP) = (
                                stateInput[0],
                                (stateInput[1], stateInput[2]),
                                (stateInput[3], stateInput[4])
                                )
    var visited = Array(repeating: Array(repeating: false, count: l), count: l)
    var stack:[(Int, Int, depth: Int)] = [(startP.0, startP.1, 0)] //depth
  
    func bfs() {
      let info = stack.removeFirst()
      let now = (info.0, info.1)
      
        if now == finishP {
          print(info.depth)
            return
        }
      
        for i in 0..<8 {
            let nr = now.0 + dr[i]
            let nc = now.1 + dc[i]
            
            guard nr >= 0 && nr < l && nc >= 0 && nc < l else { continue }
            guard !visited[nr][nc] else { continue }
            visited[nr][nc] = true
            stack.append((nr, nc, depth: info.depth + 1))
        }
      bfs()
    }
  
  visited[startP.0][startP.1] = true
  bfs()
}
