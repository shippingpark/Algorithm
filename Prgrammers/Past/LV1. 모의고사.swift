//
//  File.swift
//  Algorithm
//
//  LV1. 모의고사
//

import Foundation

// MARK: - enumerated() 사용하여 순서와 값을 동시 사용하기

func solution(_ answers:[Int]) -> [Int] {
    let person1 = [1, 2, 3, 4, 5]
    let person2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    let people = [person1, person2, person3]
    
    var countScore:[Int] = []
    let problems = answers.count
    
    for person in people {
        let personCount = person.count
        countScore.append((0...problems-1).filter{ answers[$0] == person[$0%personCount] }.count)
    }
    
    return countScore.enumerated().filter{ $0.element == countScore.max()! }.map{$0.offset+1}
}

