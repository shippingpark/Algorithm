//
//  개미.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/21.
//

// MARK: - Properties

let LRCount = readLine()!.split(separator: " ").compactMap{ Int($0) },
LCount = LRCount[0],
RCount = LRCount[1]

let lines = (0..<2).map{ _ in readLine()!.map{ String($0) } },
RDirectionLine = lines[0].reversed(),
LDirectionLine = lines[1]

let time = Int(readLine()!)!

var line = RDirectionLine + LDirectionLine
var lineOrder = Array(repeating: 0, count: LCount) + Array(repeating: 1, count: RCount)

// MARK: - Solution

for _ in (0..<time) {
  var i = 0
  while i < (line.count-1) {
    if lineOrder[i] == lineOrder[i+1] || lineOrder[i] > lineOrder[i+1] {
      i += 1 // 다음 순서 체크
    } else {
      lineOrder.swapAt(i, i+1)
      line.swapAt(i, i+1)
      i += 2 // 교환 구간 점프
    }
  }
}

print(line.joined())
