//
//  main.swift
//  소수찾기
//
//  Created by 박혜운 on 2/11/25.
//

import Foundation

// 소수란? 1을 제외하고 그 수와 1로만 나누어지는 값
func solution_소수찾기(_ numbers: String) -> Int {
  let numbers = numbers.map { String($0) }
  var visit = numbers.map { _ in false }
  var set = Set<Int>()
  
  func backtracking(word: String) {

    if let num = Int(word), !set.contains(num) && isPrime(word: word) {
      set.insert(num)
    }
    
    for i in 0..<numbers.count {
      guard !visit[i] else { continue }
      visit[i] = true
      backtracking(word: word+numbers[i]) // 쓰는 경우
      visit[i] = false
    }
  }
  
  backtracking(word: "")

  return set.count
}

func isPrime(word: String) -> Bool {
  guard let num = Int(word) else { return false }
  guard num > 1 else { return false }
  guard !(2...3).contains(num) else { return true } // 제곱근이 2보다 작으면 마감 범위가 시작 범위보다 작아질 우려
  
  for i in 2...Int(sqrt(Double(num))) {
    if num % i == 0 {
      return false
    }
  }

  return true
}

print(solution_소수찾기("17")) // 3 7, 17, 71
print(solution_소수찾기("011")) // 2 11, 101

















func solution(_ numbers: String) -> Int {
    var count = 0
    var set = Set<Int>()
    let numArray = Array(numbers)
    var visited = Array(repeating: false, count: numbers.count)
    
    func backtracking(current: String) {
        if current != "" {
            if let num = Int(current), !set.contains(num) && isPrime(num: num) {
                set.insert(num)
            }
        }
        
        for i in 0..<numArray.count {
            if !visited[i] {
                visited[i] = true
                backtracking(current: current + String(numArray[i]))
                visited[i] = false
            }
        }
    }
    
    backtracking(current: "")
    
    return set.count
}

func isPrime(num: Int) -> Bool {
    if num == 0 {
        return false
    }
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}
