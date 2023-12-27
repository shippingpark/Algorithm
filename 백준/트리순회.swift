//
//  트리순회.swift
//  Algorithm
//
//  Created by 박혜운 on 12/27/23.
//

import Foundation

// MARK: - 1

let count = Int(readLine()!)!
var results: [String] = ["", "", ""]
var tree: [String:[String]] = [:]
for _ in 0..<count {
  let input = readLine()!.split { $0 == " " }.map { String($0) }
  tree.updateValue([input[1], input[2]], forKey: input[0])
}

func dfs(_ node: String) {

  if node == "." {
    return
  }
  
  results[0] += node
  dfs(tree[node]![0])
  results[1] += node
  dfs(tree[node]![1])
  results[2] += node
}

dfs("A")

for result in results {
  print(result)
}

