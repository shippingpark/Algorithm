//
//  쇠막대기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/26.
//

import Foundation

let s = readLine()!

func solveStickDivideCount(s: String) {
  var beforeChar: Character = "("
  var stickCount = 0
  var result = 0
  for char in s {
    if char == "(" {
      stickCount += 1
    } else {
      stickCount -= 1
      if beforeChar == "(" {
        result += stickCount
      } else {
        result += 1
      }
    }
    beforeChar = char
  }
  print(result)
}

solveStickDivideCount(s: s)


// MARK: - 2

let plate = readLine()!
var before = ""
var count = 0
var result = 0

for now in plate {
  if now == "(" {
    count += 1
  } else {
    count -= 1
    if before == "(" {
      result += count
    } else {
      result += count + 1
    }
    result += stack.last == "(" ? stack.count :
  }
  before = now
}

print(result)

