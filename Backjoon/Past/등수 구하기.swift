//
//  등수 구하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/03.
//

import Foundation

let taesooInput = readLine()!.split(separator: " ").map{ Int($0)! },
  nowRecordCount = taesooInput[0],
  taesoo = taesooInput[1],
  maxRecordCount = taesooInput[2]
var record: [Int] = []
if nowRecordCount != 0 {
  record = readLine()!.split(separator: " ").map{ Int($0)! }
}

let score:[Int] = {
  var setInt: Set<Int> = []
  var map: [Int] = record
  (0..<nowRecordCount).forEach{
    let before = setInt.count
    setInt.insert( record[$0] )
    if before != setInt.count {
      map[$0] = $0 + 1
    } else {
      map[$0] = map[$0-1]
    }
  }
  return map
  }()

func checkScore() {
  guard nowRecordCount != 0 else { return print("1") }
  
  for i in 0..<nowRecordCount {
    guard i < maxRecordCount else { return print("-1") }
    guard record[i] <= taesoo else { continue }
    if record[i] == taesoo {
      let index = record.lastIndex(of: taesoo)
      index! >= maxRecordCount - 1 ? print("-1") : print(score[i])
      return
    } else { //크면
      print(score[i])
      return
    }
  }
  nowRecordCount >= maxRecordCount ? print("-1") : print(nowRecordCount+1)
  
}

checkScore()
