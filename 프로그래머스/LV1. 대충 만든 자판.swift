//
//  LV1. 대충 만든 자판.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/27.
//

import Foundation

func solution(_ keymap: [String], _ targets: [String]) -> [Int] {
    var dic: [Character: Int] = [:]
    
    for key in keymap {
        for (index, char) in key.enumerated() {
            if let order = dic[char] {
                dic[char] = order < index + 1 ? order : index + 1
            } else {
                dic[char] = index + 1
            }
        }
    }

    return targets.map {
        let characterValues = $0.map { dic[$0] ?? -1 }
        return characterValues.contains(-1) ? -1 : characterValues.reduce(0, +)
    }
}


//func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
//    var dic:[Character:Int] = [:]
//
//    for key in keymap {
//        for (index, char) in key.enumerated() {
//            if let order = dic[char] {
//                dic[char] = order < index + 1 ? order : index + 1
//            } else {
//                dic[char] = index + 1
//            }
//        }
//    }
//
//    return targets.map{$0.map{dic[Character(extendedGraphemeClusterLiteral: $0)] ?? -1}}
//        .map{ let word = $0.contains(-1) ? [-1] : $0; return word.reduce(0){$0 + $1}}
//}


print(solution(["ABACD", "BCEFD"],["ABCD","AABB", "AAVS"])) //[9, 4]
