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
// solveStickDivideCount(s: "(((()(()()))(())()))(()())") // 24
