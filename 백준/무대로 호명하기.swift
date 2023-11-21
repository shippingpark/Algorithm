//
//  무대로 호명하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/21.
//

import Foundation

func comeToStage(N: Int, students: [Int], calls: [Int]) {
  var fullTime = 0
  var line = students
  for i in 0..<N {
    let call = calls[i]
    guard let studentsOrder = line.firstIndex(of: call) else { continue }
    fullTime += studentsOrder
    line.remove(at: studentsOrder)
  }
  print(fullTime)
}

comeToStage(N: 8, students: [7, 3, 5, 1, 8, 6, 4, 2], calls: [1, 2, 3, 4, 5, 6, 7, 8])
// 17
comeToStage(N: 10, students: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], calls: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) // 0
comeToStage(N: 10, students: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], calls: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) // 45
comeToStage(N: 10, students: [7, 3, 2, 5, 1, 6, 8, 9, 10, 4], calls: [9, 2, 1, 5, 4, 6, 8, 10, 3, 7]) // 26
