//
//  랭킹전 대기열.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/01.
//

import Foundation

var queue = [[(Int, String)]]()
let V = readLine()!.split{ $0 == " " }.map { Int($0)! }, p = V[0], m = V[1]
loop: for _ in 0..<p {
  let LN = readLine()!.split{ $0 == " " }, l = Int(LN[0])!, n = String(LN[1])
  
  if queue.isEmpty {
    queue.append([(l, n)])
    continue
  }
  for i in 0..<queue.count {
    let cut = queue[i][0].0
    guard queue[i].count < m && cut+10 >= l && cut-10 <= l else { continue }
    queue[i].append((l, n))
    continue loop
  }
  queue.append([(l, n)])
}

queue.forEach {
  print($0.count == m ? "Started!" : "Waiting!")
  for i in $0.sorted(by: { $0.1 < $1.1 }) {
    print("\(i.0) \(i.1)")
  }
}


// MARK: - 틀린 풀이

//let input = readLine()!.split(separator: " ").map{ Int($0)! }
//let (peopleNumber, fullRoom) = (input[0], input[1])
//var standardLevel = -1
//var standardRoomPeople = fullRoom
//var waitingRoom:[[String]] = []
//
//for _ in 0..<peopleNumber {
//  let myInfo = readLine()!.split(separator: " ").map{ String($0) }
//  let (myLevel, _) = (Int(myInfo[0])!, myInfo[1])
//
//  if standardRoomPeople == fullRoom {//만약 방이 다 찼다면
//    print("Started!")
//    standardRoomPeople = 0 //방 비우고
//    if let standardInfo = waitingRoom.first {
//      waitingRoom.removeFirst()
//      standardLevel = Int(standardInfo[0])!
//      printPeopleInfo(standardInfo)
//      standardRoomPeople = 1
//
//      waitingRoom.filter { info in
//        Int(info[0])! <= (standardLevel + 10) && Int(info[0])! >= (standardLevel - 10)
//      }.forEach { info in
//        printPeopleInfo(info)
//        standardRoomPeople += 1
//      }
//
//      waitingRoom = waitingRoom.filter { info in
//        Int(info[0])! > (standardLevel + 10) || Int(info[0])! < (standardLevel - 10)
//      }
//
//    } else {
//      standardLevel = myLevel //내 레벨
//    }
//  }
//
//  //방에 참가 가능한 지
//  if myLevel <= (standardLevel + 10) && myLevel >= (standardLevel - 10) {
//    standardRoomPeople += 1
//    printPeopleInfo(myInfo)
//  } else {
//    waitingRoom.append(myInfo)
//  }
//}
//
//if !waitingRoom.isEmpty {
//  print("Waiting!")
//  for info in waitingRoom {
//    printPeopleInfo(info)
//  }
//}
//
//func printPeopleInfo(_ info: [String]) {
//  print(info.joined(separator: " "))
//}

