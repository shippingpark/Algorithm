//
//  N과 M (1).swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/05.
//

import Foundation

// MARK: - 1
// DP (재귀적으로 푸는 문제)
// 뎁스가 깊어짐에 따라 이전과의 중복 없이 깊어지는 방식

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0]
let M = input[1]
var result = [[Int]]()

// MARK: - 잘못된 풀이

//for i in 0..<N {
//  var arr = [Int]()
//  for _ in 0..<M { // 이렇게 접근하면 [1 2] [1 3] 의 차이 성립이 불가능함 뎁스를 기준으로 갈려야 함. DP, 재귀로 접근하자
//    if arr.count == M {
//      result.append(arr)
//    }
//    if !arr.contains(i) {
//      arr += [i]
//    }
//  }
//
//}

func dp(arr: [Int]) {
  if arr.count == M {
    result.append(arr)
    return
  }
  
  for i in 1...N {
    if !arr.contains(i) {
      dp(arr: arr + [i])
    }
  }
}

dp(arr: [])

print(result.map{ $0.map{ String($0) }.joined(separator: " ") }.joined(separator: "\n"))


// MARK: - 2

let input = Int(readLine()!)!,
N = input[0],
M = input[1]

var result = [[Int]]()

func search(arr: [Int] = []) {
  if arr.count == M {
    result.append(arr)
    return
  }
  
  for i in 1...N {
    if !arr.contains(i) {
      search(arr: arr + [i])
    }
  }
}

search()

print(result.map{ $0.map{ String($0) }.joined(separator: " ") }.joined(separator: "\n"))


// MARK: - 3

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

func dfs(arr: [Int] = []) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return
  }
  
  for i in 1...N {
    if !arr.contains(i) {
      dfs(arr: arr + [i])
    }
  }
}

dfs()


// MARK: - 4
// 뎁스가 8까지 진행될 수 있기 때문에 최댓값이 O(8^8)

let input = readLine()!.split(separator: " ").map{ Int($0)! } ,
N = input[0],
M = input[1]

func dfs(arr: [Int] = []) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
  }
  
  for i in 1...N {
    if !arr.contains(i) {
      dfs(arr: arr + [i])
    }
  }
}

dfs()

