//
//  File.swift
//  Algorithm
//
//  LV1. 로또의 최고 순위와 최저 순위
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var matchNum:Int = 0
    var zeroNum:Int = 0
    
    for a in lottos {
        if win_nums.contains(a) {
            matchNum += 1
        }
        if a == 0 {
            zeroNum += 1
        }
    }
    
    var best:Int = {
        var score = matchNum + zeroNum
        switch score {
        case 0...1: return 6
        default:
            return 7 - score
        }
    }()
        
    var worst:Int = 0...1 ~= matchNum ? 6 : 7 - matchNum

    return [best, worst]
}


print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))//[1,1]
