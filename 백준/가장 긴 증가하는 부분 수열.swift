//
//  가장 긴 증가하는 부분 수열.swift
//  Algorithm
//
//  Created by 박혜운 on 12/29/23.
//

import Foundation

// MARK: - 1
var Result = 2
var result = 2 // 최소 2

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{ Int($0)! }

for i in 0..<(N-1) {
  for j in (i+1)..<N {
    guard A[i] > A[j] else { continue }
    guard j != N-1 else { continue }
    let sum = A[i] - A[j]
    var before = j
    for k in (j+1)..<N {
      if A[k] - A[before] == sum {
        result += 1
      }
      before = k
    }
    Result = Max(Result, result)
    result = 2
  }
}




