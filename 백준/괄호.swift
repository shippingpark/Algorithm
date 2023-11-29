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


// MARK: - 2
// 괄호 문제에서, 반드시 "("의 수가 ")"보다 많거나 같을 수 밖에 없음을 유념하자!
// 문제가 생길 경우 break로 해당 루프를 탈출시켜 일관된 식을 작성할 수 있음

let T = Int(readLine()!)!

for _ in 0..<T {
  let line = readLine()!
  var count = 0
  for char in line {
    if char == "(" {
      count += 1
    } else {
      count -= 1
      if count < 0 {
        break
      }
    }
  }
  print(count == 0 ? "YES" : "NO")
}


// MARK: - 3

let N = Int(readLine()!)!

for _ in 0..<N {
  let line = readLine()!
  var count = 0
  for char in line {
    if char == "(" {
      count += 1
    } else {
      count -= 1
      if count < 0 {
        break
      }
    }
  }
  
  print(count == 0 ? "YES" : "NO")
}

