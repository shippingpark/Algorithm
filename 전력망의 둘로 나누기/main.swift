//
//  main.swift
//  전력망의 둘로 나누기
//
//  Created by 박혜운 on 3/12/25.
//

import Foundation
// 하나의 간선을 어떤식으로 없앨까?
// 트리의 표기를 어떻게 할까?

func solution_전력망의_둘로_나누기(_ n:Int, _ wires:[[Int]]) -> Int {
  var result = n
  
  for i in 0..<wires.count { // 제외할 관계
    
    var graph: [Int: [Int]] = [:]
    for j in 0..<wires.count where i != j { // 그래프 만들 때 제외
      graph[wires[j][0], default: []] += [wires[j][1]]
      graph[wires[j][1], default: []] += [wires[j][0]]
    }
    
    let firstSearch = dfs(graph: graph, start: wires[i][0])
    let secondSearch = n - firstSearch
    result = min(result, abs(firstSearch-secondSearch))
  }
  return result
}

func dfs(graph: [Int: [Int]], start: Int) -> Int {
  var stack = [start]
  var visited = Set<Int>([start])
  
  while !stack.isEmpty {
    let now = stack.removeLast()
    for child in graph[now, default: []] {
      guard !visited.contains(child) else { continue }
      visited.insert(child)
      stack.append(child)
    }
  }
  
  return visited.count
}


print(solution_전력망의_둘로_나누기(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]))
