//
//  색종이 만들기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/12.
//

import Foundation

// MARK: - 1
// 분할정복, dfs 문제
// n 짜리에 대하여 깊이가 4씩 줄어들기 때문에 n^(log4(n))이 아닐까...
// 시간 복잡도는 O(N^2 * log4N) 이라고 한다. log4냐 log2냐는 큰 차이로 안 보는 듯, 그냥 log로 표현
// 여기서 N은 (아래 코드의 n과 동일) 한 변의 길이를 의미한다.

let n = Int(readLine()!)!
let map = (0..<n).map{ _ in readLine()!.split(separator: " ").map{ String($0) } }

func dfs(rowArange: ClosedRange<Int>, colArange: ClosedRange<Int>) -> String {
  if rowArange.lowerBound == rowArange.upperBound || colArange.lowerBound == colArange.upperBound {
    return map[rowArange.lowerBound][colArange.lowerBound]
  }
  
  let midUp = (rowArange.upperBound - rowArange.lowerBound) / 2 + rowArange.lowerBound
  let midLeft = (colArange.upperBound - colArange.lowerBound) / 2 + colArange.lowerBound
  
  let one = dfs(rowArange: rowArange.lowerBound...midUp, colArange: colArange.lowerBound...midLeft)
  let two = dfs(rowArange: (midUp+1)...rowArange.upperBound, colArange: (midLeft+1)...colArange.upperBound)
  let thr = dfs(rowArange: (midUp+1)...rowArange.upperBound, colArange: colArange.lowerBound...midLeft)
  let four = dfs(rowArange: rowArange.lowerBound...midUp, colArange: (midLeft+1)...colArange.upperBound)
  
  let result = one + two + thr + four
  
  if !result.contains("0") || !result.contains("1") {
    return one
  } else {
    return result
  }
}

let result = dfs(rowArange: 0...(n-1), colArange: 0...(n-1)).map{ $0 }

print(result.filter{ $0 == "0" }.count)
print(result.filter{ $0 == "1" }.count)



// MARK: - 2
// Range를 통해서 값을 전부 반환 받아서 계산하는 이전 풀이 방식이 아닌,
// 큰 조각부터 검사하고, 만약 그 조각이 원하는 검사를 만족하지 않는다면 작게 줄여서 다시금 검사하는 방식으로
// 무커 풀이 참고
// 원래 풀던 dfs 방식과 사고하는 방식이 다른 느낌이다
// 하지만 한 번 훑는 다는 것에 초점을 맞추면, 매번 다시 훑는 아래 방식보다 위의 방식이 더 좋아보인다 

let N = Int(readLine()!)!
let paper: [[Int]] = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
var result: Array<Int> = [0, 0]

func task(r: Int = 0, c: Int = 0, size: Int = N) {
  let type = paper[r][c]
  var canCrop = true
  
  for i in r..<(r+size) {
    if !paper[i][c..<c+size].allSatisfy{ $0 == type } {
      canCrop = false
      break
    }
  }
  
  if canCrop {
    result[type] += 1
  } else {
    for rn in stride(from: r, to: r+size, by: size/2) {
      for cn in stride(from: c, to: c+size, by: size/2) {
        task(r: rn, c: cn, size: size/2)
      }
    }
  }
}

task()

print("\(result[0]) \(result[1])")







