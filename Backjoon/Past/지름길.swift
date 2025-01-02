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



// MARK: - 3
// DP 풀이로 풀려고 했지만, 이 문제가 동적 계획법일까?
// 오히려 모든 경로를 탐색하며 갱신하는 그리디 또는 탐색에 가까운 것 같다
// 하지만 DP 풀이를 보자.
// 해당 문제는 지름길로 가냐, 그냥 도로로 가냐를 매번 체크하며 지난 DP 배열을 갱신시킬 수 있다
// 문제는 이해했는데 이렇게까지 하는 이유를 모르겠다... start를 인덱스로 활용하기 위해 어쩔 수 없는 선택이었겠지...?


// 지름길의 개수, 고속도로 길이
var N: Int = 0
var D: Int = 0

// 지름길의 위치, 거리를 저장하는 배열
var path = [[(end: Int, length: Int)]](repeating: [], count: MAX)

// 특정 위치까지 가는 최단 거리를 저장하는 테이블
var dist = [Int](repeating: 0, count: MAX)

func input() {
  let inputs = readLine()!.split(separator: " ").map { Int($0)! }
  N = inputs[0]
  D = inputs[1]
  
  // i 위치까지 가는 최단 거리 초기화
  for i in 0...D {
    dist[i] = i
  }
  
  for _ in 0..<N {
    let shortcut = readLine()!.split(separator: " ").map { Int($0)! }
    let start = shortcut[0]
    let end = shortcut[1]
    let length = shortcut[2]
    
    if end > D || end - start <= length {
      continue
    }
    
    path[start].append((end, length))
  }
}

input()

var before: Int = 0
for i in 0...D {
  before = i == 0 ? -1 : dist[i - 1]
  
  // 지름길 반영한 최단 거리와 일반 고속도로 이용한 거리 중 최소값
  dist[i] = min(dist[i], before + 1)
  
  // i 위치에서 출발하는 지름길이 있다면
  for edge in path[i] {
    let end = edge.end
    let length = edge.length
    
    // 최단 거리 테이블 갱신
    if dist[end] > dist[i] + length {
      dist[end] = dist[i] + length
    }
  }
}

// D까지 가는 최단 거리 출력
print(dist[D])

// MARK: - 4 : DP

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], D = input[1]
var short: [[(finish: Int, len: Int)]] = Array(repeating: [], count: D+1)
var road: [Int] = (0...D).map{ $0 }
// road[D] == D

for _ in 1...N {
  let input = readLine()!.split(separator: " ").map{ Int($0)! }
  guard input[0] < D else { continue } // 이 코드 유무로 런타임 에러 발생
  short[input[0]].append( (finish: input[1], len: input[2]) )
}

for i in 0...D {
  let beforeLen = i == 0 ? -1 : road[i - 1]
  road[i] = min(road[i], beforeLen + 1) // 지름길이 적용된 값이냐 아니냐
  
  for short in short[i] { // 지름길이 있다면
    guard short.finish <= D else { continue }
    road[short.finish] = min(road[short.finish], road[i] + short.len)
  }
}

print(road[D])


// MARK: - 5

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], D = input[1]

let shorts = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! }}
  .sorted{ $0[0] < $1[0] }
var result = Int.max

func task(idx: Int = 0, realD: Int = 0, nowP: Int = 0) {
  guard nowP <= D else { return }
  result = min(result, (D-nowP) + readD)
  
  for i in idx..<N {
    task(idx: i+1, realD: realD + shorts[i][2], nowP: shorts[i][1])
  }
}

print(result)

// MARK: - 6

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], D = input[1]

let shorts = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! }}
  .sorted{ $0[0] <= $1[0] }
var result = Int.max

func task(idx: Int = 0, realD: Int = 0, nowP: Int = 0) {
  guard nowP <= D else { return }
  result = min(result, (D-nowP)+realD)
  
  for i in idx..<N {
    guard nowP <= shorts[i][0] else { continue }
    task(idx: i+1, realD: (shorts[i][0]-nowP)+realD+shorts[i][2], nowP: shorts[i][1])
  }
}

task()

print(result)

