//
//  File.swift
//  Algorithm
//
//  Lv1. 내적
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return (0...a.count-1).map{a[$0] * b[$0]}.reduce(0, +)
}

// MARK: - zip(a,b)를 활용한 풀이
//튜플 값으로 반환 해주는 함수

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map{$0.0 * $0.1}.reduce(0, +)
}

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map{ * }.reduce(0, +)
}
