//
//  창고 다각형.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/27.
//

import Foundation

let columeCount = Int(readLine()!)!
var columeMap: [[Int]] = []

for _ in 1...columeCount {
    let colume: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
    columeMap.append(colume)
}

columeMap.sort{ return $0[0] < $1[0] }
let heightMap = columeMap.map{ $0[1] }
let positionMap = columeMap.map{ $0[0] }

let maxHeight = heightMap.max()!
let maxHeightLeftIndex = columeMap.map{ $0[1] }.firstIndex(of: maxHeight)! //기준

var result = 0

var nowIndex = maxHeightLeftIndex //1️⃣ : 좌 탐색
var nowLeftP = positionMap[nowIndex]

while nowIndex != 0 {
  if let maxHeight = heightMap[0..<nowIndex].max(), let maxLeftIndex = heightMap[0..<nowIndex].lastIndex(of: maxHeight) {
    result += ((positionMap[nowIndex]-positionMap[maxLeftIndex]) * maxHeight)
    nowIndex = maxLeftIndex
  }
}

result += maxHeight //2️⃣ 가장 큰 기둥 넓이만 더함

nowIndex = maxHeightLeftIndex //3️⃣ : 우 탐색
nowLeftP = positionMap[nowIndex]

while nowIndex != (columeCount-1) {
  if let maxHeight = heightMap[(nowIndex+1)..<columeCount].max(), let maxLeftIndex = heightMap[(nowIndex+1)..<columeCount].firstIndex(of: maxHeight) {
    result += ((positionMap[maxLeftIndex] - positionMap[nowIndex]) * maxHeight)
    nowIndex = maxLeftIndex
  }
}

print(result)
