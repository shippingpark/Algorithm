//
//  File.swift
//  LV1. 과일 장수
//
//  Created by 박혜운 on 2023/01/31.
//

import Foundation


// MARK: - 시간 초과 코드

//func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
//    let fullApple = score.count
//    let fullBox = fullApple / m //2
//    var maxApple = fullBox * m
//    var result:Int = .zero
//
//    var sortAppleGrade = score.sorted()
//    if fullApple-maxApple > 0 {
//        sortAppleGrade[0...fullApple-maxApple-1] = []
//    }
//
//    while sortAppleGrade.count >= m {
//        result += sortAppleGrade.first! * m
//        sortAppleGrade[0...(m-1)] = []
//    }
//    return result
//}

//개선점 : array 배열의 크기를 지속적으로 잘라내는 점.


// MARK: - 같은 로직, 배열 길이 수정 없는 코드

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let fullApple = score.count //8
    var result:Int = .zero
    var last:Int = m - 1
    var sortAppleGrade = score.sorted(by: >)
    
    while last < fullApple {
        result += sortAppleGrade[last] * m
        last += m
    }

    return result
}

//나누어 떨어지는 요소에 대한 계산만 이루어져야 할 때, 그 크기만큼의 구간 설정은 while로 해결할 수 있다


print(solution(3, 4, [1, 2, 3, 1, 2, 3, 1])) //8
print(solution(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2])) //33
