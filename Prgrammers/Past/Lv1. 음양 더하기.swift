

//  Lv1. 음양 더하기


import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    for (i, a) in signs.enumerated() {
        if a {
            result += absolutes[i]
        }
        else {
            result -= absolutes[i]
        }
    }
    return result
}

// MARK: - 고차함수 활용 풀이 map , reduce
//0부터 n까지 차례로 든 배열 (0...n).map 을 index 배열로 보는 풀이 

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}

