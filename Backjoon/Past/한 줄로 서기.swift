//
//  한 줄로 서기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/04.
//

import Foundation

let input = Int(readLine()!)!
let line = readLine()!.split(separator: " ").map{ Int($0)! }
var order: [Int] = []

for i in (0..<input).reversed() {
  let now = line[i]
  order.insert(i+1, at: now)
}

print(order.map{ String($0) }.joined(separator: " "))
