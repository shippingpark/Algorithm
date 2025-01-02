//
//  NBA농구.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/26.
//

import Foundation

struct GoalTime { //분 단위로 계산
  private var hour: Int
  private var min: Int
  
  init(timeBoard: String) {
    let scoreBoard = timeBoard.split(separator: ":").map{ Int($0)! }
    self.hour = scoreBoard[0]
    self.min = scoreBoard[1]
  }
  
  func toMin() -> Int {
    return (hour * 60) + min
  }
}

struct ScoreBoard { //스코어를 추가하고, 승자를 확인 가능
  private var firstTeamScore: Int = 0
  private var secondTeamScore: Int = 0
  
  var winner: Int? {
    guard firstTeamScore != secondTeamScore else { return nil }
    return firstTeamScore > secondTeamScore ? 1 : 2
  }
  
  mutating func addScore(team: String) {
    if team == "1" {
      self.firstTeamScore += 1
    } else {
      self.secondTeamScore += 1
    }
  }
}

let input: Int = Int(readLine()!)!
var goalTimeHistory:[GoalTime] = [GoalTime(timeBoard: "00:00")]//시작 시간
var scoreBoard = ScoreBoard()
var stringFormat = "%1$02d:%2$02d"
var resultMin = [0, 0]

for round in 1...input {
  let line: [String] = readLine()!.split(separator: " ").map{ String($0) }
  let nowGoalTime: GoalTime = GoalTime(timeBoard: line[1]) //현재 골 넣은 시간
  
  if let winner = scoreBoard.winner { //이전까지 누군가 이기고 있었다면
    resultMin[winner-1] += (nowGoalTime.toMin() - goalTimeHistory[round-1].toMin()) //지난번 골 부터 현재 골 시간까지 승자에게 더하기
  }
  goalTimeHistory.append(nowGoalTime) //골 시간 배열에 현재 골 시간 추가
  scoreBoard.addScore(team: line[0]) //현재 스코어
}

if let winner = scoreBoard.winner { //경기 종료에 누군가 이기고 있었다면
  resultMin[winner-1] += (GoalTime(timeBoard: "48:00").toMin() - goalTimeHistory[input].toMin())
}

print(String(format: stringFormat, resultMin[0] / 60, resultMin[0] % 60 ))
print(String(format: stringFormat, resultMin[1] / 60, resultMin[1] % 60 ))
