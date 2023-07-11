

import Foundation

func eat(_ n: Int, _ x: Int) -> Int {
    var burger = [Int](repeating: 1, count: 51) // 버거의 레이아웃 갯수
    var patty = [Int](repeating: 1, count: 51) // 버거의 패티 갯수

    for i in 1...n {
        burger[i] = 1 + burger[i-1] + 1 + burger[i-1] + 1
        patty[i] = patty[i-1] + 1 + patty[i-1]
    }

    if n == 0 {
        return x
    }
    if x == 1 {
        return 0
    } else if x <= 1 + burger[n-1] { // case 1
        return eat(n-1, x-1) // 맨 아래 번 빼고 (x-1)
    } else if x == 1 + burger[n-1] + 1 { // case 2 딱 ~가운데 패티까지 먹은 경우
        return patty[n-1] + 1
    } else if x <= burger[n-1] + burger[n-1] + 1 + 1 { // case 3
        return patty[n-1] + 1 + eat(n-1, x-(burger[n-1]+2))
    } else { // case 4
        return patty[n]
    }
}

if let input = readLine() {
    let values = input.split(separator: " ").map { Int($0)! }
    let N = values[0]
    let X = values[1]
    print(eat(N, X))
}
