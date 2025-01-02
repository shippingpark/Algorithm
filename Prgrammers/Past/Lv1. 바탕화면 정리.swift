//
//  Lv1. 바탕화면 정리.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/01.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var (lux, luy) = (50, 50)
    var (rdx, rdy) = (0, 0)
    
    wallpaper.enumerated().forEach{ (r, line) in
        line.enumerated().forEach{ (c, area) in
            if area == "#" {
                lux = min(lux, r)
                luy = min(luy, c)
                rdx = max(rdx, r)
                rdy = max(rdy, c)
            }
        }
    }
    
    return [lux, luy, rdx+1, rdy+1]
}

//func solution(_ wallpaper:[String]) -> [Int] {
//    typealias Position = (Int, Int) //(r, c)
//    var start: Position = (wallpaper.count-1, wallpaper[0].count-1)
//    var finish: Position = (0,0)
//
//    wallpaper.enumerated().forEach{ (r, line) in
//        line.enumerated().forEach{ (c, area) in
//            if area == "#" {
//                start = Position(min(start.0, r), min(start.1, c))
//                finish = Position(max(finish.0, r+1), max(finish.1, c+1))
//            }
//        }
//    }
//
//    return [start.0, start.1, finish.0, finish.1]
//}


print(solution([".#...", "..#..", "...#."])) //[0, 1, 3, 4]
