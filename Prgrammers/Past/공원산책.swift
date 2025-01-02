//
//  공원산책.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/12.
//
// MARK: - 공원 산책

import Foundation

extension String {
    func direction() -> (Int, Int) {
        switch self {
        case "N": return (-1,0)
        case "S": return (1,0)
        case "W": return (0,-1)
        case "E": return (0,1)
        default: return (0,0)
        }
    }
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park:[[String]] = park.map{$0.map{String($0)}}
    let R = park.count
    let C = park.first!.count
    
    var position:(Int, Int) = {
        var position = (0,0)
    Loop: for i in 0..<R {
            for j in 0..<C {
                if park[i][j] == "S" {
                    position = (i, j)
                    break Loop
                }
            }
        }
        return position
    }()
    
Route: for route in routes {
        let direction = String(route.prefix(1)).direction()
        let move:Int = Int(route.suffix(1))!
        var nextR = position.0
        var nextC = position.1
        
        for _ in 1...move {
            nextR += direction.0
            nextC += direction.1
            
            guard nextR >= 0 && nextR < R && nextC >= 0 && nextC < C else {continue Route}
            guard park[nextR][nextC] != "X" else {continue Route}
        }
        position = (nextR, nextC)
    }
    
    return [position.0, position.1]
}
