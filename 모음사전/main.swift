//
//  main.swift
//  모음사전
//
//  Created by 박혜운 on 3/3/25.
//

import Foundation

// MARK: - 첫 번째 풀이
// 장점 : 값을 찾으면 종료
// 단점 : 보기 불편
// 개선할 점 : 어차피 모든 word를 작성해 나갈거라면
// word의 인덱스 위치가 곧 넘버링, result를 따로 보관할 필요가 X

func solution_모음사전1(_ word: String) -> Int {
  let order: [String] = ["A", "E", "I", "O", "U"]
  
  var stack: [String] = [""]
  var result = -1
  
  func dfs() -> Int {
    
    while !stack.isEmpty {
      let nowWord = stack.removeLast()
      result += 1
      
      if nowWord == word {
        break
      }
      
      guard nowWord.count != 5 else { continue }
      
      for i in stride(from: 4, through: 0, by: -1) {
        let new = nowWord + order[i]
        stack.append(new)
      }
    }
    
    return result
  }
  
  return dfs()
}


// MARK: - 두 번째 풀이
// 재귀를 이용해서 푸는 풀이
// 장점 : 조건문이 한 가지로, 간결하다
// 단점 : 결과값을 찾아도 멈출 수 없다
// inout 파라미터를 넣어 전체적으로 실행을 막을 수는 있겠다

func solution_모음사전3(_ word: String) -> Int {
  let order: [String] = ["A", "E", "I", "O", "U"]
  var stack: [String] = []
  
  func dfs(str: String) {
    stack.append(str)
    
    guard str.count != 5 else {return}
    
    for i in 0..<5 {
      dfs(str: str + order[i])
    }
  }
  
  dfs(str: "")
  
  return stack.firstIndex(of: word)!
}
