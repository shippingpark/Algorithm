//
//  통나무 건너뛰기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/08.
//

import Foundation

// MARK: - 1

let n = Int(readLine()!)!

for _ in 0..<n {
  let _ = readLine()
  
  let map = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
  var result = Int.min
  
  for i in 0..<(map.count-2) {
    result = max(result, map[i+2] - map[i])
  }
  
  print(result)
}

// MARK: - 2

let n = Int(readLine()!)!

for _ in 0..<n {
  let _ = readLine()
  
  let map: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
  var result = Int.min
  
  for i in 0..<(map.count-2) {
    result = max(result, map[i+2] - map[i])
  }
  
  print(result)
}


// MARK: - 3

let n = Int(readLine()!)!

for _ in 0..<n {
  _ = readLine()
  
  var count = Int.min
  let map = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
  
  for i in 0..<(map.count-2) {
    count = max(count, map[i+2] - map[i])
  }
  print(count)
}

