//
//  StackChallenge.swift
//  DataStructures
//
//  Created by 박혜운 on 1/6/25.
//

import Foundation

// MARK: - 배열의 내용을 역순으로 인쇄하는 함수
func reversedPrint<T>(array: Array<T>) {
  var stack = Stack<T>()
  
  for value in array {
    stack.push(value)
  }
  
  while let value = stack.pop() {
    print(value)
  }
}

// MARK: - 괄호의 균형 맞추기
let parentheses: [[Character]] = [["(", ")"], ["[", "]"], ["{", "}"]]
func balancedPrint(_ string: String) -> Bool {
  var stack = Stack<Character>()
  
  for char in string {
    if char.isOpen() {
      stack.push(char)
    } else {
      if let last = stack.pop(), !matches(openTerm: last, closeTerm: char) {
        return false
      }
    }
  }
  
  return stack.isEmpty
}

extension Character {
  func isOpen() -> Bool {
    for parenthesis in parentheses {
      if self == parenthesis[0] {
        return true
      }
    }
    return false
  }
}

func matches(openTerm: Character, closeTerm: Character) -> Bool {
  for parenthesis in parentheses {
    if openTerm == parenthesis[0] {
      return closeTerm == parenthesis[1]
    }
  }
  
  return false
}
