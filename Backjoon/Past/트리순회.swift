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

// MARK: - 2

let N = Int(readLine()!)!
var dic = [String: [String]]()

(0..<N).map { _ in readLine()!.split(separator: " ").map{ String($0) }}
  .forEach({ dic[$0[0]] = [$0[1], $0[2]] })

func preorder(root: String = "A") -> String {
  if root == "." { return "" }
  return root + preorder(root: dic[root]![0]) + preorder(root: dic[root]![1])
}

func inorder(root: String = "A") -> String {
  if root == "." { return "" }
  return inorder(root: dic[root]![0]) + root + inorder(root: dic[root]![1])
}

func postorder(root: String = "A") -> String {
  if root == "." { return "" }
  return postorder(root: dic[root]![0]) + postorder(root: dic[root]![1]) + root
}

print(preorder())
print(inorder())
print(postorder())
