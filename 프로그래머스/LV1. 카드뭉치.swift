//
//  file2.swift
//  LV1. 카드뭉치
//
//  Created by 박혜운 on 2023/02/17.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    var goal = goal
    var result:String = "Yes"
    
    while !goal.isEmpty {
        let firstWord = goal.removeFirst()
        if firstWord == cards1.first {
            cards1.removeFirst()
        } else if firstWord == cards2.first {
            cards2.removeFirst()
        } else {
            result = "No"
            break
        }
    }
    return result
}

//print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"])) //"Yes"
