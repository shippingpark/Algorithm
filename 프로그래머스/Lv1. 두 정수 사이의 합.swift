//
//  File.swift
//  Algorithm
//
//  Lv1. 두 정수 사이의 합
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    guard a < b else { return Int64((b...a).reduce(0,+)) }
    return Int64((a...b).reduce(0,+))
}

// MARK: - 다른 풀이 (시간 초과 발생)

func solution(_ a:Int, _ b:Int) -> Int64 {
    return Int64(Array(a < b ? a...b : b...a).reduce(0, +))
  }

