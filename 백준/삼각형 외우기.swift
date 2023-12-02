//
//  삼각형 외우기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/30.
//

import Foundation

// MARK: - 1

let angle = (0..<3).map{ _ in Int(readLine()!)! }
let count = Dictionary(grouping: angle, by: { $0 }).count

if angle.reduce(0, +) != 180 {
  print("Error")
} else if count == 1 {
  print("Equilateral")
} else if count == 2 {
  print("Isosceles")
} else {
  print("Scalene")
}

// MARK: - 2
// 180이 아닌건데, 이상으로 놓아서 자꾸 틀림
// 문제가 원하는 바를 꼼꼼히 살피기 

let angles = (1...3).map{ _ in Int(readLine()!)! }
let anglesSet = Set(angles)

if angles.reduce(0, +) != 180 {
  print("Error")
} else {
  switch anglesSet.count {
  case 1: print("Equilateral")
  case 2: print("Isosceles")
  default: print("Scalene")
  }
}


// MARK: - 3

let angles = (0..<3).map{ _ in Int(readLine()!)! }
let set = Set(angles)

func triangleType() -> String {
  if angles.reduce(0, +) != 180 {
    return "Error"
  }
  
  switch set.count {
  case 1: return "Equilateral"
  case 2: return "Isosceles"
  default: return "Scalene"
  }
}

print(triangleType())

