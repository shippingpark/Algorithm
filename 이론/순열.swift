//
//  순열.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/09.
//

let n = Int(readLine()!)!
let line = readLine()!
var picked = [Int]()
var visited = Array(repeating: false, count: n)
var result = [String]()
 
func pick(toPick: Int) {
  if toPick == 0 {
    result.append(picked.map { String($0) }.joined(separator: " "))
    //print()를 하거나 
    if let last = result.last, last == line {
      let beforeIndex = result.count - 2
      beforeIndex < 0 ? print("-1") : print(result[beforeIndex])
    }
    
    return
  }
  
  for i in 0..<n {
    if visited[i] {
      continue
    }
    picked.append(i+1)
    visited[i] = true
    pick(toPick: toPick - 1)
    visited[i] = false
    picked.removeLast()
  }
}

//pick(toPick: n)
