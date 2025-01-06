//
//  printSorted.swift
//  DataStructures
//
//  Created by 박혜운 on 1/6/25.
//

import Foundation

// MARK: - 공간 복잡도 O(n)
func printSortedWithPlayground(_ array: [Int]) {
  let sorted = array.sorted() // array만큼의 공간 n이 필요하므로
  for element in sorted {
    print(element)
  }
}

// MARK: - 공간 복잡도 O(1)
func printSorted(_ array: [Int]) {
  // 1
  guard !array.isEmpty else { return }

  // 2
  var currentCount = 0
  var minValue = Int.min

  // 3
  // minValue는 전부 print하고 시작
  for value in array {
    if value == minValue {
      print(value)
      currentCount += 1
    }
  }

  while currentCount < array.count { // 배열을 전부 돌기
  
    // 4
    var currentValue = array.max()! // 현재 값
    
    for value in array {
      // 현재 값보다 작고 최솟값보다 크다면 현재값 갱신
      // 최솟값 찾는 방법임
      if value < currentValue && value > minValue {
        currentValue = value
      }
    }

    // 5
    var printCount = 0
    for value in array {
      if value == currentValue {
        print(value)
        currentCount += 1
      }
    }

    // 6
    // 최솟값을 현재 값(최솟값보다는 반드시 크지만 제일 작은값) 으로 갱신하고 다시 반복
    minValue = currentValue
  }
}
