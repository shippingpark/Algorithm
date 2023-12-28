//
//  CCW.swift
//  Algorithm
//
//  Created by 박혜운 on 12/23/23.
//

import Foundation

// MARK: - 1
let p = (0..<3).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }

print(
  ((p[1][0]-p[0][0]) * (p[2][1]-p[0][1]) - (p[2][0]-p[0][0]) * (p[1][1]-p[0][1]))
    .signum()
)

// MARK: - 2

let p = (0..<3).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }

print(
  ((p[1][0]-p[0][0]) * (p[2][1]-p[0][1]) - (p[2][0]-p[0][0]) * (p[1][1]-p[0][1]))
    .signum()
)

// MARK: - 3

let p = (0..<3).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }

print(
  ((p[1][0]-p[0][0])*(p[2][1]-p[0][1]) - (p[2][0]-p[0][0])*(p[1][1]-p[0][1]))
    .signum()
)

// MARK: - 3

let p = (0..<3).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }

print(
  ((p[1][0]-p[0][0])*(p[2][1]-p[0][1])-(p[2][0]-p[0][0])*(p[1][1]-p[0][1]))
  .signum()
)


