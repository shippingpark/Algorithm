//
//  LV2. 스킬트리.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/06.
//

import Foundation

//[0...] <- 수정고?

// MARK: - 개선 풀이, 시간복잡도 30만 -> 3천만대

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skillOrder = Array(skill)
    var result:Int = 0
    
    for tree in skill_trees {
        let tree = tree.filter{skillOrder.contains($0)}
            if String(skillOrder[0..<tree.count]) == tree {
                result += 1
            }
    }
    return result
}


// MARK: - 최초 풀이, 필요 없는 내용 포함

//func solution(_ skill:String, _ skill_trees:[String]) -> Int { //ABA AB
//    let skillOrder = skill.map{String($0)} // O(N) : 26
//    var result:Int = 0
//
//    tree : for tree in skill_trees { //O(N) : 20
//        let tree = tree.map{String($0)} // O(N) : 26
//        var progressIndex = 0 //해도 되는 인덱스
//        for skill in tree { // O(N) : 26 //누적 시간복잡도 20 * 26
//            if skillOrder.contains(skill) { //O(N) 26 //누적 시간복잡도 20 * 26 * 26
//                let skillOrderIndex = skillOrder.firstIndex(of: skill)! //O(N) : 26 //누적 시간복잡도 20 * 26 * 26 * 26
//                guard skillOrderIndex <= progressIndex else {continue tree}
//                guard skillOrderIndex == progressIndex else {continue}
//                progressIndex += 1
//            }
//        }
//        result += 1
//    }
//
//    return result
//}

//최종 20 * 26 * 26 * 26 ==> 대략 35만


//func solution(_ skill:String, _ skill_trees:[String]) -> Int {
//    let skillOrder = skill.map{String($0)}
//    var result:Int = 0
//
//    tree : for tree in skill_trees {
//        let tree = tree.map{String($0)}
//        var progressIndex = 0
//        for skill in tree {
//            if skillOrder.contains(skill) {
//                let skillOrderIndex = skillOrder.firstIndex(of: skill)!
//                guard skillOrderIndex <= progressIndex else {continue tree}
//                guard skillOrderIndex == progressIndex else {continue}
//                progressIndex += 1
//            }
//        }
//        result += 1
//    }
//
//    return result
//}
//
////최종 20 * 26 * 26 * 26 ==> 대략 35만
//print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
