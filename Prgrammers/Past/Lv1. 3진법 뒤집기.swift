//
//  File.swift
//  Algorithm
//
//  Lv1. 3진법 뒤집기
//

import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(String(n,radix: 3).reversed()),radix: 3)!
}

//print(solution(45)) //7
//print(solution(125)) //229
