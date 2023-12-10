//
//  N으로 표현.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/08.
//

import Foundation
// MARK: - 1
// 처음 문제를 봤을 때 전혀 모르겠다는 생각이 들었음
// DP가 뭔지도 모르니 문제유형이 힌트가 되지도 않았음
// DP 문제 풀이를 찾아보며, 해당 문제가 d[i] = d[j] + d[i-j] 의 합에 해당하는 문제임을 이해하고, 왜 DP 로 분류되는 지 이해하였음
// 더불어 Array 내부 요소를 Set으로 둘 수 있음을 깨달음. 중복을 피할 수 있어 매우 유용해 보임

//참고한 첫 번 째 풀이
func solution(_ N:Int, _ number:Int) -> Int {
  var dp = Array(repeating: Set<Int>(), count: 9) // 1부터 8까지 N을 사용하는 경우를 저장할 배열. Set을 사용하여 중복 제거
  var result = Int.max // 결과값 초기화. 최솟값을 찾기 위해 가장 큰 값으로 초기화
  
  for i in 1..<9 { // 1부터 8까지 반복. N을 i번 사용하는 경우의 수를 찾음
    for j in 1..<i { // N을 j번 사용하는 경우와 i-j번 사용하는 경우의 조합을 찾음
      for k in dp[i - j] { // i-j번 사용하여 만들 수 있는 모든 숫자에 대하여
        for l in dp[j] { // j번 사용하여 만들 수 있는 모든 숫자에 대하여
          
          // 사칙연산 적용. 각 경우에 대해 결과가 number와 같은지 확인하고, 같다면 result 업데이트
          if k - l > 0 { // dp[i - j] - dp[j] 가 0 보다 크다면 뺀 값
            dp[i].insert(k - l) // 조합해서 나오는 수를 넣고
            if k - l == number { // 만약 그 조합한 수가 원하는 결과라면
              result = min(result, i) // 결과값을 갱신 (기존의 것보다 작은 값인 지 체크하고 넣음)
            }
          }
          if l != 0 && k != 0{ // 0으로 나누는 것을 방지, 둘 다 0이면 거르고, 아니라면
            dp[i].insert(k / l) // 나눈 값을 넣고
            if k / l == number{ // 그 값이 정답이라면
              result = min(result, i) // 값 갱신
            }
          }
          dp[i].insert(k + l) // 더한 값
          dp[i].insert(k * l) // 곱한 값
          if k + l == number{result = min(result, i)} // 정답이라면 갱신
          if k * l == number{result = min(result, i)} // 정답이라면 갱신
        }
      }
    }
    var str = "" // N을 문자열로 i번 반복하여 만듦. 예: N이 5이고 i가 2이면 "55" 생성
    // String(repeating: "\(N)", count: i) // 이건 시간초과 발생
    for _ in 1...i { // i 번 짜리 N 만들기
      str += "\(N)"
    }
    dp[i].insert(Int(str)!) // 반복된 문자열을 숫자로 변환하여 삽입
    if Int(str)! == number {
      result = min(result, i)
    } // 변환된 숫자가 number와 같은 경우 result 업데이트
  }
  if result == Int.max { // 결과가 업데이트되지 않았다면 -1 반환
    result = -1
  }
  return result // 결과 반환
}

// 참고한 두 번째 풀이
// 완성되면 어떻게 끝낼 지 항상 고민이었는데, inout으로 값의 변동을 반영할 수 있음을 이해
  // N과 number는 고정값, depth
func dfs(_ N: Int, _ number: Int, _ depth: Int, _ temp: Int, _ answer: inout Int)  {
  
  // depth가 8을 초과하면 더 이상 탐색하지 않음 (조건에 따라 최대 8번만 사용 가능)
  if depth > 8 {
    return
  }
  
  // temp(현재까지의 계산 결과)가 number와 같고, 현재 depth가 현재까지의 최소 depth보다 작거나, answer가 -1이면 answer 업데이트
  if temp == number && (answer > depth || answer == -1) {
    answer = depth
  }
  
  var calc = 0 // N을 연속으로 이어 붙인 숫자를 만들기 위한 변수
  
  for index in 0..<8 { // 최대 8번까지 N을 이어 붙일 수 있음
    calc = calc * 10 + N // 예를 들어, N이 5이고 index가 2이면 calc는 555가 됨
    // 다음 깊이(depth)로 재귀 호출하여 네 가지 사칙연산 적용
    dfs(N, number, depth + 1 + index, temp + calc, &answer) // 덧셈
    dfs(N, number, depth + 1 + index, temp - calc, &answer) // 뺄셈
    dfs(N, number, depth + 1 + index, temp * calc, &answer) // 곱셈
    dfs(N, number, depth + 1 + index, temp / calc, &answer) // 나눗셈 (0으로 나누는 경우는 별도 처리 필요)
  }
}
func solution(_ N:Int, _ number:Int) -> Int {
  var answer = -1 // 결과 초기화. 찾을 수 없는 경우 -1을 반환하기 위함
  dfs(N, number, 0, 0, &answer) // DFS 시작
  return answer // 결과 반환
}



// MARK: - 2

func solution(_ N:Int, _ number:Int) -> Int { // N을 사용하여 number를 만드는데 필요한 N의 갯수 반환
  var dp = Array(repeating: Set<Int>(), count: 9)
  var result = Int.max
  
  for i in 1..<9 { // N을 i번 사용해서 만들 수 있는 수들의 집합
    for j in 1..<i { // i 보다 작은 수 j
      for k in dp[i-j] { // N을 (i-j) 번 사용하여 만들 수 있는 수들의 집합
        for l in dp[j] { // N을 j번 사용하여 만들 수 있는 수들의 집합
          
          if k - l > 0 { // 앞의 경우의 수가 뒤의 경우의 수보다 크면
            dp[i].insert(k - l) // d[i-j] - d[j]
            if k - l == number { // 음수 값이 원하는 값이라면
              result = min(result, i)
            }
          }
          
          if l != 0 && k != 0 { // 1 이상이니까 분자가 (l) 인 경우도 제외
            dp[i].insert(k/l)
            if k / l == number {
              result = min(result, i)
            }
          }
          
          dp[i].insert(k + l)
          dp[i].insert(k * l)
          
          if k + l == number {
            result = min(result, i)
          }
          if k * l == number {
            result = min(result, i)
          }
        }
      }
    }
    
    var str = ""
    for _ in 1...i { //i개로 구성된 문자
      str += "\(N)"
    }
    
    dp[i].insert(Int(str)!)
    if Int(str)! == number {
      result = min(result, i)
    }
  }
  
  if result == Int.max {
    result = -1
  }
  
  return result
}
