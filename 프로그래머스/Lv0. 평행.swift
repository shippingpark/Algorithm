//
//  File.swift
//  Algorithm
//
//  Lv0. 평행 
//

import Foundation

func solution(_ dots:[[Int]]) -> Int {
    var compareDots = dots
    compareDots.remove(at: 0)
    var allInclination:[Double] = []
    for dot in dots {
        let dotX = dot[0] //기준 점 x 좌표
        let dotY = dot[1] //기준 점 y 좌표
        let inclination:[Double] = compareDots.map{ compareDot in
            Double(compareDot[1]-dotY)/Double(compareDot[0]-dotX)
        }
        allInclination += inclination
        
        if Set(allInclination).count <= allInclination.count - 1 {
            return 1
        }
        if !compareDots.isEmpty {
            compareDots.remove(at: 0)
        }
    }
    return 0
}

print(solution([[1, 4], [9, 2], [3, 8], [11, 6]]))
