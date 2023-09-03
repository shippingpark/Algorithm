//
//  인사성 밝은 곰곰이.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/09/04.
//

import Foundation

let inputCount = Int(readLine()!)!
var afterEnterId = Set<String>()
var temp = 0

for _ in 0..<inputCount {
  let input = readLine()!
  if input == "ENTER" {
    temp += afterEnterId.count
    afterEnterId = .init()
    continue
  } else {
    afterEnterId.insert(input)
  }
}

print(temp + afterEnterId.count)
