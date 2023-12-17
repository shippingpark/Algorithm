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


// MARK: - 2
// 정렬하는 것 잊어서 틀렸다 문제 천천히 읽기!
// 케이스가 N개고 깊이가 N 이므로 O(N^N) 이지만, if 로 걸러내기 때문에 실제로는 그보다 작다

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], D = input[1]
let shortcut = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
  .sorted(by: { $0[0] <= $1[0] })
var result = Int.max

func dfs(nowP: Int = 0, shortIdx: Int = 0, loadSum: Int = 0) {
  result = min(result, loadSum + (D - nowP))
  
  for i in shortIdx..<N {
    let way = shortcut[i]
    if way[0] >= nowP && way[1] <= D {
      dfs(nowP: way[1], shortIdx: i+1, loadSum: loadSum + (way[0] - nowP) + way[2])
    }
  }
}

dfs()

print(result)



// MARK: - 3 : DP 풀이 확인



