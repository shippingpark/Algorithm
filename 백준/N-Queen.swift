//
//  N-Queen.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/09.
//

import Foundation

// MARK: - 1
// 시간초과 발생 풀이 1 - 1

var count = 0
var n: Int = 0
var board: [Int] = Array(repeating: 0, count: 15)

// 유망한지 판단하는 함수
func promising(_ cdx: Int) -> Bool {
  for i in 0..<cdx {
    if board[cdx] == board[i] || cdx - i == abs(board[cdx] - board[i]) {
      return false
    }
  }
  return true
}

// nqueen 알고리즘 수행
func nqueen(_ cdx: Int) {
  if cdx == n { // 마지막 열이라면
    count += 1 // case 하나 추가하고
    return // 종료
  }
  
  for i in 0..<n {
    board[cdx] = i // cdx번째 행, i번째 열에 queen을 놓아본다.
    if promising(cdx) { // 그 자리에 두어도 괜찮았다면,
      nqueen(cdx + 1) // 그 다음 행에 대해 퀸을 놓는 것을 해 본다.
    }
  }
}

// 메인 함수
n = Int(readLine()!)!
board = Array(repeating: 0, count: n) // 보드 크기를 n으로 설정
nqueen(0)
print(count)


// 성공 풀이 1 - 2
// 전역 변수 선언
var count = 0 // 유효한 퀸 배치 수를 세는 변수
var n: Int = 0 // 체스판의 크기 (n x n)
var board: [Int] = [] // 각 행에 배치된 퀸의 열 위치를 저장하는 배열
var columnUsed: [Bool] = [] // 각 열에 퀸이 배치되었는지 여부를 추적하는 배열
var diagonal45Used: [Bool] = [] // 45도 대각선에 퀸이 배치되었는지 여부를 추적하는 배열
var diagonal135Used: [Bool] = [] // 135도 대각선에 퀸이 배치되었는지 여부를 추적하는 배열

// 현재 행과 열에 퀸을 배치할 수 있는지 판단하는 함수
func isPromising(_ row: Int, _ col: Int) -> Bool {
  return !columnUsed[col] && !diagonal45Used[row + col] && !diagonal135Used[n - 1 + col - row]
}

// nqueen 알고리즘을 수행하는 함수
func nqueen(_ row: Int) {
  if row == n { // 모든 행에 퀸을 배치했다면 유효한 해결책
    count += 1
    return
  }
  
  for col in 0..<n { // 현재 행의 모든 열을 순회
    if isPromising(row, col) { // 현재 위치에 퀸을 배치할 수 있는지 확인
      board[row] = col // 퀸 배치
      // 해당 열과 대각선을 사용 중으로 표시
      columnUsed[col] = true
      diagonal45Used[row + col] = true
      diagonal135Used[n - 1 + col - row] = true
      
      nqueen(row + 1) // 다음 행에 대해 재귀적으로 함수 호출
      
      // 백트래킹: 퀸의 배치를 취소하고 다른 위치를 탐색
      columnUsed[col] = false
      diagonal45Used[row + col] = false
      diagonal135Used[n - 1 + col - row] = false
    }
  }
}

// 메인 함수
n = Int(readLine()!)! // n값 입력 받기
// 배열 크기 초기화
board = Array(repeating: 0, count: n)
columnUsed = Array(repeating: false, count: n)
diagonal45Used = Array(repeating: false, count: 2 * n - 1)
diagonal135Used = Array(repeating: false, count: 2 * n - 1)
nqueen(0) // nqueen 알고리즘 시작
print(count) // 결과 출력

// 더 적합한 풀이 1 - 3

func solution(_ n:Int) -> Int {
  
  var chess = Array(repeating: -1, count: n)
  var answer = 0
  
  // 유망성 검사
  func checkArrangeQueen(row: Int) -> Bool {
    for i in 0..<row {
      if chess[i] == chess[row] || abs(chess[row] - chess[i]) == abs(row - i) {
        // 같은 열이거나 대각선일 경우
        return false
      }
    }
    
    return true
  }
  
  // 행을 기준으로 DFS. 1행 -> 2행 -> 3행 ...
  
  func dfs(row: Int) {
    
    // 만약에 끝까지 다 배치했을 경우. +1
    if row == n {
      answer += 1
      return
    }
    
    // 하나의 행에서 모든 열의 유망성을 검사한다.
    for i in 0..<n {
      chess[row] = i // 그 자리에 일단 배치
      
      if checkArrangeQueen(row: row) {
        // 배치할 수 있다면,
        dfs(row: row + 1) // 다음 행 DFS
      }
      // 배치할 수 없다면 다음 index로 넘어감.
    }
  }
  
  dfs(row: 0)
  
  return answer
}


// MARK: - 2



