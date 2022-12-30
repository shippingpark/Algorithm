//
//  File.swift
//  Algorithm
//
//Lv1. 정수 내림차순으로 배치하기
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    return Int64(String(n).sorted(by: >).map{String($0)}.joined())!
}

// MARK: - 풀이 변경
//Array(String)에 바로 Int64를 씌울 수 있다

func solution(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}



print(solution(123423522))

