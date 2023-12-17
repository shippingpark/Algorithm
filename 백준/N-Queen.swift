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
  
  // 유효성 검사
  func checkArrangeQueen(row: Int) -> Bool { // 해당 행에 두는 게 가능한가?
    for i in 0..<row { // 인덱스 위치가 곧 행을 의미 / 그 행의 몇 번째 열에 있는 지 확인 하는 과정
      if chess[i] == chess[row] || abs(chess[row] - chess[i]) == abs(row - i) {
        // 같은 열에 존재하는 체스가 있거나, 열과 행의 차가 같을 때 == 기울기가 같으면 대각선 불가
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


// 직접 풀어보기
func solution(n: Int) {
  var visited = Array(repeating: false, count: n)
  var board = Array(repeating: -1, count: n)
  var count = 0
  
  func promising(row: Int) -> Bool {
    for compareRow in 0..<row { // 해당 row 값이 괜찮은 지 이전 값들의 위치와 비교하는 과정
      if board[compareRow] == board[row] || ( abs(board[compareRow] - board[row]) == (row - compareRow) ) {
        return false
      }
    }
    return true // 문제가 없다면 해당 row의 col에 두는 거 ㅇㅋ
  }
  
  func dfs(row: Int) {
    if row == n {
      count += 1
      return
    }
    
    for checkCol in 0..<n {
      guard !visited[checkCol] else { continue }
      board[row] = checkCol
      if promising(row: row) { // 해당 row의 col값이 이전 col 값들과 비교하여 유효하다면
        visited[row] = true
        dfs(row: row + 1) // 다음 행도 검사
        visited[row] = false
      }
    }
  }
  
  dfs(row: 0)
  
  print(count)
}
let n = Int(readLine()!)!
solution(n: n)



// MARK: - 2

let n = Int(readLine()!)!
var board = Array(repeating: -1, count: n)
var visited = Array(repeating: false, count: n)
var count = 0

func promising(row: Int) -> Bool {
  for i in 0..<row {
    if board[row] == board[i] || row - i == abs(board[row] - board[i]) {
      return false
    }
  }
  return true
}

func backTracking(row: Int) {
  if row == n { // 어디서 row 값이 추가되는 지 확인하자. row가 목표에 도달하면 그 값이 n-1이다.
    count += 1
    return
  }
  
  for i in 0..<n {
    guard !visited[i] else { continue }
    board[row] = i
    if promising(row: row) {
      visited[i] = true
      backTracking(row: row + 1)
      visited[i] = false
    }
  }
}

backTracking(row: 0)
print(count)



// MARK: - 3
// 백트래킹으로 풀어야 함

let N = Int(readLine()!)!
var queen = Array(repeating: -1, count: N) // index는 r, 값은 c / // queen[r] = c
var visited = Array(repeating: false, count: N)
var result = 0

func promising(r: Int, c: Int) -> Bool {
  for checkR in 0..<r {
    if queen[checkR] == c || r - checkR == abs(c - queen[checkR]) {
      return false
    }
  }
  return true
}

func bp(r: Int = 0) {
  if r == N {
    result += 1
    return
  }
  
  for nc in 0..<N {
    guard !visited[nc] else { continue }
    queen[r] = nc
    if promising(r: r, c: nc) {
      visited[nc] = true
      bp(r: r+1)
      visited[nc] = false
    }
    // 여기에 visited false 조건 줘서 틀림 ...... 
  }
}

bp()

print(result)


// MARK: - 3
// 백트래킹 풀이
// r 값은 순차적으로 증가하니까 같은 r 값이 중복되는 지 걸러 줄 필요가 없지만,
// c 값은 전체 영역을 대상으로 적용되므로, 미리미리 저장해 두고 promising 을 확인하지 이전 단계에 중복을 걸러주자 
let n = Int(readLine()!)!
var count = 0
var queen = [Int](repeating: -1, count: n) // index는 r / value는 c queen[r] = c
var visited = [Bool](repeating: false, count: n)

func promising(r: Int) -> Bool {
  for i in 0..<r {
    if r == i || r - i == abs(queen[r] - queen[i]) {
      return false
    }
  }
  return true
}

func task(r: Int) {
  if r == n {
    count += 1
    return
  }
  
  for i in 0..<n {
    guard !visited[i] else { continue }
    queen[r] = i
    if promising(r: r) {
      visited[i] = true
      task(r: r + 1)
      visited[i] = false
    }
  }
}

task(r: 0)

print(count)
