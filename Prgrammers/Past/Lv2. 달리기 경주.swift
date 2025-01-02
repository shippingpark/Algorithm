//
//  Lv2. 달리기 경주.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/03.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var playersIndex:[String:Int] = Dictionary(uniqueKeysWithValues: zip(players,(0..<players.count)))
    var result:[String] = players
    
    for calling in callings {
        let 내자리 = playersIndex[calling]!
        let 내이름 = result[내자리]
        let 앞선수 = result[내자리-1]
        result.swapAt(내자리, 내자리-1)
        playersIndex[내이름]! -= 1
        playersIndex[앞선수]! += 1
    }
    return result
}

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
