//
//  File.swift
//  Algorithm
//
//  LV1. 실패율
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageFailCount:[Int:Double] = [:]
    
    (1...N).forEach{stageFailCount[$0] = 0}
    
    stages.forEach{
        guard $0 < N + 1 else { return }
        stageFailCount[$0]! += 1
    }
    
    var passUser:Double = Double(stages.count)
    
    (1...N).forEach{
        guard passUser != 0 else {return stageFailCount[$0] = 0}
        let failNum = stageFailCount[$0]!
        stageFailCount[$0] = failNum / passUser
        passUser -= failNum
    }
        
    return stageFailCount.sorted{
        $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value
    }.map{$0.key}
}



