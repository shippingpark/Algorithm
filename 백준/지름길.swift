//
//  지름길.swift
//  Algorithm
//
//  Created by 박혜운 on 12/13/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0],
D = input[1]

let map = (0..<N)
  .map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
  .filter{ $0[1] <= D }
  .sorted(by: { $0[0] <= $1[0] } )

var result = D

func dfs(nowIdx: Int = 0, nowP: Int = 0, len: Int = 0) {
  guard nowIdx <= N else { return }
  result = min(result, D - nowP + len)
  
  for i in nowIdx..<map.count {
    let startP = map[i][0]
    if nowP <= startP {
      dfs(nowIdx: i + 1, nowP: map[i][1], len: len + (startP-nowP) + map[i][2] )
    }
  }
}

dfs()

print(result)
