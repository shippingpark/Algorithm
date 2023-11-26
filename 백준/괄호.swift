//
//  괄호.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/26.
//

import Foundation

// MARK: - 1

Next: for _ in 0..<Int(readLine()!)! {
  let line = readLine()!
  var stack: [Character] = []

  for char in line {
    if char == "(" {
      stack.append(char)
    } else {
      guard stack.popLast() != nil else { print("NO"); continue Next }
    }
  }
  stack.isEmpty ? print("YES") : print("NO")
}
