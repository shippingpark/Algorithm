//
//  수들의 합.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/12/04.
//

import Foundation

// MARK: - 1
// N이 40억 이상일 때, 어떤 방식을 선택해야 할까? 10억 이하인 게 가장 정설 같은데!
// 덧셈 개념이니까, N으로 가는 건 아닌 것 같은데...
// 마지막 수만 커지면 되니까, 최대한 1부터 더해서 주어진 수에 가장 가까운 수로 만들고, 마지막에 튀는 수를 픽하면 되는 것 같은데
// 시간복잡도를 어떻게 계산하지? 알고보니 주어지는 것은 N이 아닌 S였다. 둘의 상관관계를 식으로 표현하면 됌
// 자연수의 전체 합이 N(N+1)/2 = S 니까, N = 루트(S)
// 시간복잡도 상으로 10^5 제곱으로 바뀌니까 충분히 가능

// 딱 떨어지는 경우를 계산하기 위해서 < 가 아닌 <= 여야 함
// 매번 S-sum을 계산해주므로, 마지막 print 단에서 확인할 수 있도록 before 변수 삭제 및 전체 식 수정

let S = Int(readLine()!)!
var sum = 0
var count = 0

while sum <= S {
  count += 1
  sum += count
}

print(sum == count ? count : count - 1)


// MARK: - 2

let S = Int(readLine()!)!
var count = 0
var sum = 0

// 아주 작은 수의 경우 1..<S 로 두면 틀리게 됌. 예를 들어, 1일 경우도 있고.
// 이 문제는 while 로 푸는 게 더 좋아 보임, 구간이 절대적으로 S의 영향을 받지는 않기 때문
// 1씩 증가하기에

for i in 1...S {
  guard sum < S else { break }
  sum += i
  count = i
}

print(sum == S ? count : count - 1)


// MARK: - 3

let S = Int(readLine()!)!
var count = 0
var sum = 0

while sum < S {
  count += 1
  sum += count
}

print(sum == S ? count : count - 1)


// MARK: - 4

let n = Int(readLine()!)!
var result = 0
var sum = 0

while sum < n {
  result += 1
  sum += result
}

print(sum == n ? result : result - 1)


// MARK: - 5
// 편의를 위해 변수를 많이 줄였지만 이런 풀이는 좋지 않다
// result 변수를 따로 만들어서 진행하면 좋겠다

let N = Int(readLine()!)!
var natural = 0
var sum = 0

while sum < N {
  natural += 1 // 이게 아래 줄로 이동하면 natural과 result 간에 1 차이가 생긴다 while 이 끝날 때 natural이 다음 루프를 대비하고 있지 않아야 이해하기 쉬운 코드가 된다. 그러므로 다음 코드에 대비하지 않도록, sum += natural 윗 줄에 위치시켰다
  sum += natural
}

print(sum == N ? natural : natural - 1)

