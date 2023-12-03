//
//  좌표 정렬하기 2.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/03.
//

import Foundation

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
