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


// MARK: - 2
// 답은 맞는데, 틀렸다고 출력됌
// propertyWrapper 써서 그런가? 흠 다음엔 sturct로 만들어서 풀어봐야겠다 

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let M = NM[1]
let info = readLine()!.split(separator: " ").map{ Int($0)! }
var room = (0..<N).map{ _ in readLine()!.split(separator: " ") }
let dirR = [-1, 0, 1, 0] // 북 서 남 동
let dirC = [0, -1, 0, 1]

//typealias Position = (r: Int, c: Int)

@propertyWrapper
struct HeadDirection {
  var wrappedValue: Int {
    didSet {
      self.wrappedValue = (wrappedValue + 4) % 4
    }
  }
  
  init(wrappedValue: Int) {
    self.wrappedValue = wrappedValue
  }
}

@propertyWrapper
struct Position {
  var wrappedValue: (r: Int, c: Int)? {
    didSet {
      if let wrappedValue = wrappedValue,
         (wrappedValue.r >= 0) && (wrappedValue.r < N) && (wrappedValue.c >= 0) && (wrappedValue.c < M) && (room[wrappedValue.r][wrappedValue.c] != "1") {
        self.wrappedValue = wrappedValue
      } else {
        self.wrappedValue = nil
      }
    }
  }
}

func cleanRoom() -> Int {
  @Position var nowP = (r: info[0], c: info[1])
  @HeadDirection var nowH = info[2]
  
  var cleanCount = 0
  
  while true {
    guard let nowPP = nowP else { break }
    if room[nowPP.r][nowPP.c] == "0" {
      room[nowPP.r][nowPP.c] = "-1"
      cleanCount += 1
//      print("⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️")
//      print(room.map{ $0.joined(separator: " ") }.joined(separator: "\n"))
//      print("⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️")
    }
    
    let fourWay = (0..<4).map{ Position(wrappedValue: (r: nowPP.r + dirR[$0], c: nowPP.c + dirC[$0])).wrappedValue }
//    print(fourWay)
    let fourWayCompact = fourWay.compactMap({ $0 })
    if !fourWayCompact.isEmpty { // 주위에 벽이 아닌 공간이 존재
      nowH += 1 // 90도 회전
      
      if fourWayCompact.map({ room[$0.r][$0.c] == "0" }).contains(true) { // 청소할 곳이 있다면
        if let newP = fourWay[nowH], room[newP.r][newP.c] == "0" { // 90도 회전한 곳에 자리가 있고, 그게 청소 가능 하다면
          nowP = newP
        }
        continue
      } else { // 청소할 곳이 없다면
        nowH += 1 // 뒤로 돌려서
        if let backP = fourWay[nowH] { // 뒤로 갈 방향 찾고
          nowH += 2 // 머리는 원상 복귀
//          print("현재 머리 방향 \(nowH) 현재 위치 \(nowPP)와 뒤로 이동 위치 \(backP)")
          nowP = backP
        } else {
          break
        }
      }
    }
  }
  
  return cleanCount
}

print(cleanRoom())



// MARK: - 3

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

let info = readLine()!.split(separator: " ").map{ Int($0)! }
var nowP = (info[0], info[1])
var nowHead = info[2]

var map = (0..<n).map{ _ in readLine()!.split(separator: " ") }

let dirR = [-1, 0, 1, 0] // 북 동 남 서
let dirC = [0, 1, 0, -1]

var count = 0

while true {
  if map[nowP.0][nowP.1] == "0" {
    switch nowHead {
    case 0: map[nowP.0][nowP.1] = "⬆️"
    case 1: map[nowP.0][nowP.1] = "➡️"
    case 2: map[nowP.0][nowP.1] = "⬇️"
    default: map[nowP.0][nowP.1] = "⬅️"
    }
    count += 1
  }
  
  print("✨✨✨✨✨✨✨✨✨✨✨✨")
  print(map.map{ $0.joined(separator: " ") }.joined(separator: "\n"))
  print("✨✨✨✨✨✨✨✨✨✨✨✨")
  
  let fourWay: [(Int, Int)?] =
  (0..<4)
    .map{ (nowP.0 + dirR[$0], nowP.1 + dirC[$0]) }
    .map{ (row, col) in
      if (row >= 0) && (row < n) && (col >= 0) && (col < m) && (map[row][col] != "1") {
        return (row, col)
      } else {
        return nil
      }
    }
  
  if !fourWay.compactMap({ $0 }).filter({ (row, col) in map[row][col] == "0" }).isEmpty { // 4방향 중 청소 가능한 공간이 있다면
    nowHead = (nowHead + 3) % 4 // 90도 이동하고
    if let headP = fourWay[nowHead], map[headP.0][headP.1] == "0" { // 앞쪽이 청소 가능하다면
      nowP = headP
    }
    continue
  } else if let backP = fourWay[(nowHead + 2) % 4] { // 청소 가능한 공간이 없다면
    nowP = backP
  } else {
    break
  }
}

print(count)
