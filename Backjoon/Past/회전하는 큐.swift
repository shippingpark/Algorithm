//
//  회전하는 큐.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/11.
//

import Foundation

let input: [Int] = readLine()!.split(separator: " ").compactMap{ Int($0) },
N = input[0],
M = input[1]

let findNumber: [Int] = readLine()!.split(separator: " ").compactMap{ Int($0) }
var numberQueue: [Int] = (1...N).map{ $0 }
var startInx = 0
var result = 0


for findNum in findNumber {
  guard let findIdx = numberQueue.firstIndex(of: findNum) else { continue }
  let movePosition = Int(exactly: findIdx)!.절대위치(length: numberQueue.count, startIdx: startInx)
  numberQueue.remove(at: findIdx)
  
  if movePosition <= numberQueue.count / 2 { //여기서 나는 0, movePosition는 길이값에 대한 절대 좌표계
    result += movePosition
  } else {
    result += (numberQueue.count - movePosition + 1)
  }
  startInx = findIdx
}

print(result)

extension Int {
  func 절대위치(length: Int, startIdx: Int) -> Int {
    if self < startIdx {
      return length + self - startIdx // 여기가 인덱스 초과되는 것도 방지
    } else {
      return self - startIdx
    }
  }
}
