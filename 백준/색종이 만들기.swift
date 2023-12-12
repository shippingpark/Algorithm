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
