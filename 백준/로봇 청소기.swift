//
//  로봇 청소기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/01.
//

import Foundation

// MARK: - 1
// 뒤로 가기를 신경쓰지 않아서 꼼꼼하게 풀지 못했음
// 문제가 적은 대로, 천천히 풀어보자
// 시간 복잡도는 O(N*M*4) .. 보다 많지 않을까

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let info = readLine()!.split(separator: " ").map{ Int($0)! }
var map = (0..<NM.first!).map{ _ in readLine()!.split(separator: " ").map{ String($0) } }

let dirR = [-1, 0, 1, 0] // 북 동 남 서
let dirC = [0, 1, 0, -1]

var nowH = info[2]
var nowP = (info[0], info[1])
var beforeP = (-1, -1)
var count = 0

nextPoint: while true {
  beforeP = nowP
  
  if map[nowP.0][nowP.1] == "0" {
    count += 1
    map[nowP.0][nowP.1] = "-1"
  }
    
  for i in (1...4) {
    let checkH = (nowH + i) % 4
    let checkP = (nowP.0 + dirR[checkH], nowP.1 + dirC[checkH])
    guard checkP.0 >= 0 && checkP.0 < NM[0] && checkP.1 >= 0 && checkP.1 < NM[1] else { continue }
    if map[checkP.0][checkP.1] == "0" {
      nowH = (nowH+3) % 4
      let checkP90 = (nowP.0 + dirR[nowH], nowP.1 + dirC[nowH])
      guard checkP90.0 >= 0 && checkP90.0 < NM[0] && checkP90.1 >= 0 && checkP90.1 < NM[1] else { continue nextPoint }
      guard map[checkP90.0][checkP90.1] == "0" else { continue nextPoint }
      nowP = checkP90
      continue nextPoint
    }
  }
  
  let backH = (nowH+2) % 4
  let checkP = (nowP.0 + dirR[backH], nowP.1 + dirC[backH])
  if !(checkP.0 >= 0 && checkP.0 < NM[0] && checkP.1 >= 0 && checkP.1 < NM[1]) {
    break
  } else if map[checkP.0][checkP.1] != "1" {
    nowP = checkP
  } else {
    break
  }
}

print(count)
