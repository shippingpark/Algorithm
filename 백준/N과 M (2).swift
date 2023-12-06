//
//  N과 M (2).swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/06.
//

import Foundation

// MARK: - 1
// 풀다가 정신 잃지 않도록...!!! 

let input = readLine()!.split(separator:" ") .map{ Int($0)! },
N = input[0], M = input[1]
var result = [[Int]]()

func searchNext(arr: [Int] = [], dot: Int = 1) {
  if arr.count == M {
    result.append(arr)
    return
  }
  
  for i in dot...(N - M + arr.count + 1) {
    searchNext(arr: arr + [i], dot: i + 1)
  }
}

searchNext()

print(result.map{ $0.map{ String($0) }.joined(separator: " ") }.joined(separator: "\n"))
