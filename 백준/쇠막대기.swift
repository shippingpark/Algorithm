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

// MARK: - 3

let line = readLine()!
var before: Character = "("
var count = 0
var result = 0

for char in line {
  if char == "(" {
    count += 1
  } else {
    count -= 1
    if before == "(" {
      result += count
    } else {
      result += 1
    }
  }
  before = char
}

print(result)


// MARK: - 4
// 레이저와 아예 그 파이프가 끊어지는 경우를 좌우를 기준으로 분리해야 함.
// 이 부분이 헷갈려서 이상하게 품. 조건 분기 잘 할 것

let line = readLine()!
var before: Character = "("
var count = 0
var result = 0

for char in line {
  if char == "(" {
    count += 1
  } else {
    count -= 1
    if before == ")" { // 레이저 쏜 게 아님, 내려가는 거
      result += 1
    } else { // 레이저 쏜 거 
      result += count
    }
  }
  before = char
}

print(result)


// MARK: - 5

let line = readLine()!
var before: Character = "("
var count = 0
var result = 0

for char in line {
  if char == "(" {
    count += 1
  } else {
    count -= 1
    if before == "(" {
      result += count
    } else {
      result += 1
    }
  }
  before = char
}

print(result)

