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
