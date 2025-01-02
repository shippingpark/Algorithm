//
//  LV2. 광물 캐기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/03.
//

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    //다이아 곡괭이 : 0, 철 곡괭이 : 1, 돌 곡괭이: 2
    var minResult = Int.max
    
    func dfs(pick:Int, count: Int, result: Int, picks:[Int], minerals:[String]) {
        guard !minerals.isEmpty else {
            minResult = min(minResult, result)
            return
        }
        
        if count == 5 { //곡괭이 다 씀
            guard !picks.filter{ $0 != 0 }.isEmpty else { //만약 새로 꺼낼 곡괭이 없으면 종료
                minResult = min(minResult, result)
                return
            }
            var newPicks = picks
            for newPick in 0...2 { //미네랄 삭제 안하고 곡괭이 바꾸기만 함
                guard newPicks[newPick] > 0 else { continue }
                newPicks[newPick] -= 1 //꺼낸 곡괭이 지우고
                dfs(pick: newPick, count: 0, result: result, picks: newPicks, minerals: minerals)
            }
        } else { //같은 곡괭이로 진행
            var newMinerals = minerals
            let last = newMinerals.removeLast()
            dfs(pick: pick, count: count + 1, result: result + last.needFatigue(pick: pick), picks: picks, minerals: newMinerals)
        }
    }
    
    for startPick in 0...2 {
        guard picks[startPick] > 0 else { continue }
        var newPicks = picks
        newPicks[startPick] -= 1
        dfs(pick: startPick, count: 0, result: 0, picks: newPicks, minerals: minerals.reversed())
    }
    
    return minResult == Int.max ? 0 : minResult
}


extension String {
    func needFatigue(pick: Int) -> Int {
        guard pick != 0 else { return 1 }
        switch self {
            case "diamond":
                return Int(pow(5.0, Double(pick)))
            case "iron":
                return Int(pow(5.0, Double(pick-1)))
            case "stone": return 1
            default: return 1
        }
    }
}
