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

