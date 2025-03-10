//
//  main.swift
//  이분 그래프
//
//  Created by 박혜운 on 2/13/25.
//

import Foundation

let K = Int(readLine()!)!
for _ in 0..<K {
  let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
  let (V, E) = (input[0], input[1])
  var list = Array(repeating: [], count: V+1)
  var color = Array(repeating: -1, count: V+1) // 0부터 V까지
  
  for _ in 0..<E {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    list[a] += [b]
    list[b] += [a]
  }
  
  var result = true
  for parent in 0..<list.count {
    guard color[parent] == -1 else { continue }
    
    for child in list[parent] {
      if color[child] == -1 {
        color[child] = 1- color[parent]
      } else if color[parent] == color[child] {
        result = false
        break
      }
    }
    print(result)
  }
}
