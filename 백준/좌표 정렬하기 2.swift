//
//  좌표 정렬하기 2.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/03.
//

import Foundation

// MARK: - 1

let N = Int(readLine()!)!
var coordinates: [[Int]] = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }

coordinates.sort {
  if $0.last == $1.last {
    return $0.first! <= $1.first!
  } else {
    return $0.last! < $1.last!
  }
}

print(coordinates.map{ $0.map{ String($0) }.joined(separator: " ") }.joined(separator: "\n"))



// MARK: - 2

let N = Int(readLine()!)!

let result: [(Int, Int)] =
(0..<N)
  .map{ _ in
    let arr =
    readLine()!
    .split(separator: " ")
    .map{ Int($0)! }
    return (arr[1], arr[0])
  }
  .sorted(by: <)

print(
  result
    .map{
      "\($0.1) \($0.0)"
    }
    .joined(separator: "\n")
)


// MARK: - 3

let N = Int(readLine()!)!
let input = (0..<N)
  .map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
  .map{ ($0[1], $0[0]) }
  .sorted(by: <)

input.forEach{ print("\($0.0) \($0.1)") }



