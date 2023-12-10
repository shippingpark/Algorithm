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


// MARK: - 2

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

func dfs(arr: [Int], start: Int) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return
  }
  
  for i in start...(N - M + arr.count + 1) {
    dfs(arr: arr + [i], start: i + 1)
  }
}

dfs(arr: [], start: 1)


// MARK: - 3
// 종료조건 주의!!
// 포함조건 주의

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0],
M = input[1]

func dfs(arr: [Int] = [], idx: Int = 0) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return // 종료조건 주의!! 아니면 메모리 초과 뱅글뱅글 오바 돈다
  }
  
  for i in (idx+1)..<( N - M + arr.count + 1) { // 포함 조건 주의
    dfs(arr: arr + [i], idx: i)
  }
}

dfs()
