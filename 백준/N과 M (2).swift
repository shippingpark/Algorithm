//
//  N과 M (2).swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/06.
//

import Foundation

// MARK: - 1
// 풀다가 정신 잃지 않도록...!!! 

let input = readLine()!.split(separator:" ") .map{ Int($0)! },
N = input[0], M = input[1]
var result = [[Int]]()

func searchNext(arr: [Int] = [], dot: Int = 1) {
  
  if arr.count == M {
    result.append(arr)
    return
  }
  
  for i in dot...(N - M + arr.count + 1) {
    searchNext(arr: arr + [i], dot: i + 1)
  }
}

searchNext()

print(result.map{ $0.map{ String($0) }.joined(separator: " ") }.joined(separator: "\n"))


// MARK: - 2

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

func dfs(arr: [Int], start: Int) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return
  }
  
  for i in start...(N - M + arr.count + 1) {
    dfs(arr: arr + [i], start: i + 1)
  }
}

dfs(arr: [], start: 1)


// MARK: - 3
// 종료조건 주의!!
// 포함조건 주의

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0],
M = input[1]

func dfs(arr: [Int] = [], idx: Int = 0) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return // 종료조건 주의!! 아니면 메모리 초과 뱅글뱅글 오바 돈다
  }
  
  for i in (idx+1)..<( N - M + arr.count + 1) { // 포함 조건 주의
    dfs(arr: arr + [i], idx: i)
  }
}

dfs()


// MARK: - 4
// 이전에 했던 경우는 포함하면 안됨.
// for 문을 돌려서 이전에 쌓았던 것을 지나치면 반드시 초반에서 차이가 생기므로 중복 안 생김 (검토할 필요가 없음)
// 그렇다면 이 문제는 for를 돌리며 한 depth씩 깊어지면 됨
// 이동할 때 그 이전의 값 이후부터 시작해야하므로 start index를 파라미터로 넘기는 것이 좋을 듯
// 시간복잡도는 그 전에 도달했던 것에 다시 돌아오지 않으므로
// 수열을 만드는 과정에서, 각 숫자를 선택하는 데는 최대 N가지의 선택이 가능하고, 이러한 선택은 M번 반복됩니다. 그러나 오름차순을 유지해야 하기 때문에, 실제 선택의 수는 종종 N보다 적을 수 있습니다.
// O(N^M)

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0],
M = input[1]

func dfs(arr: [Int] = [], now: Int = 1) {
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return
  }
  
  for i in now...(N - M + arr.count + 1) { // ClosedRange 일 때는 Upper와 lower가 같아도 괜춚
    dfs(arr: arr + [i], now: i + 1)
  }
}

dfs()


// MARK: - 5
let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

func dfs(arr:[Int] = [], num: Int = 1) {
  
  if arr.count == M {
    print(arr.map{ String($0) }.joined(separator: " "))
    return
  }
  
  guard num <= N else { return }
  for i in num...N {
    dfs(arr: arr + [i], num: i + 1)
  }
}

dfs()

