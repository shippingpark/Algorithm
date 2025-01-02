//
//  main.swift
//  Algorithm
//
//  LV1. 문자열 나누기
//

import Foundation

func solution(_ s:String) -> Int {
    let sNew = s.prefix(s.count - 1) //맨 뒷 글자 제외
    var originalChar:Character = "_"
    var originalCount:Int = 0
    var anotherCount:Int = 0
    var result = 1
    
    for char in sNew {
        if originalCount == 0 {
            originalCount += 1
            originalChar = char
        } else if originalChar == char {
            originalCount += 1
        } else {
            anotherCount += 1
        }

        if originalCount == anotherCount {
            result += 1
            originalCount = 0
            anotherCount = 0
        }
    }
    
    return result
}

print(solution("banana")) //3
print(solution("abracadabra")) //6
print(solution("aaabbaccccabba"))//3
