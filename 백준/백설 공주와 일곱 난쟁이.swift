//
//  백설 공주와 일곱 난쟁이.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/01.
//

import Foundation

// MARK: - 1
// 재귀로 진행하다가, 중도에 값 발견 시 진행하던 것을 연쇄적으로 멈출 수 있도록
// Bool 값 반환으로 신호 전달 

let ages = (0..<9).map{ _ in Int(readLine()!)! }

func removeDwarf(_ array: [Int], _ n: Int) -> [Int] {
    var result = [Int]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [Int]) -> Bool {
        if now.count == n {
          var check = array
          now.reversed().forEach{ check.remove(at: $0) }
          if check.reduce(0, +) == 100 {
            result = check
            return true
          }
          return false
        }
        
        for i in index..<array.count {
          if cycle(i + 1, now + [i]) {
            return true
          }
        }
      
      return false
    }
    
    _ = cycle(0, [])
    
    return result
}

print(removeDwarf(ages, 2).map{ String($0) }.joined(separator: " "))


// MARK: - 2
// (i+1) 부터 검증
// 재귀보다 좀 더 깔끔하게 만들 수 있었던 느낌
// 왜냐면 재귀는 중도에 멈추는 타이밍 잡기가 어려움, 전체를 다 봐야지 멈추는 느낌
// 다음 번에 전체를 보지 않고 주어진 것만 돌리는 재귀를 만들어보자

var numbers = (0..<9).map{ _ in Int(readLine()!)! }
let fullCount = numbers.reduce(0, +)

loop: for i in 0..<9 {
  for j in (i+1)..<9 { // i 부터가 아니라, i + 1부터
    if fullCount - numbers[i] - numbers[j] == 100 {
      numbers.remove(at: j)
      numbers.remove(at: i)
      break loop
    }
  }
}

print(numbers.map{ String($0) }.joined(separator: "\n"))



// MARK: - 3
// 하... i는 포함하는 거 아님! 이번에도 잊어서 틀렸다 주의 

import Foundation

var numbers = (0..<9).map{ _ in Int(readLine()!)! }
let sum = numbers.reduce(0, +)

loop: for i in 0..<9 {
  for j in (i+1)..<9 {
    if sum - numbers[j] - numbers[i] == 100 {
      numbers.remove(at: j)
      numbers.remove(at: i)
      break loop
    }
  }
}

numbers.forEach{ print($0) }


// MARK: - 4

let ages = (0..<9).map{ _ in Int(readLine()!)! }
let sum = ages.reduce(0, +)

for i in 0..<8 {
  for j in (i+1)..<9 {
    if sum - ages[i] - ages[j] == 100 {
      for k in ages.indices where k != i && k != j {
        print(ages[k])
      }
    }
  }
}

// MARK: - 5

var numbers = (0..<9).map{ _ in Int(readLine()!)! }
let sum = numbers.reduce(0, +)

loop: for i in 0..<9 {
  for j in (i+1)..<9 { // ✨ 매번 여기서 틀림 ㅜ i+1 부터 시작하기! 
    if sum - numbers[i] - numbers[j] == 100 {
      numbers.remove(at: j)
      numbers.remove(at: i)
      for num in numbers {
        print(num)
      }
      break loop
    }
  }
}

// MARK: - 6

var len = (0..<9).map{ _ in Int(readLine()!)! }
let sum = len.reduce(0, +)

loop: for i in 0..<9 {
  for j in (i+1)..<9 {
    if sum - len[i] - len[j] == 100 {
      len.remove(at: j)
      len.remove(at: i)
      break loop
    }
  }
}

len.forEach{ print($0) }
