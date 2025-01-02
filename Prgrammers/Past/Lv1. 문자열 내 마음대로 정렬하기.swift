//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/01/03.
//

import Foundation

// MARK: - 첫 시도
//func solution(_ sizes:[[Int]]) -> Int {
//    var w:Int = 0 //(좌, 우) (가로, 세로)
//    var h:Int = 0
//    sizes.map{$0[0] >= $0[1] ? $0 : $0.reversed()}.forEach{size in
//        if size[0] >= w {
//            w = size[0]
//        }
//        if size[1] >= h {
//            h = size[1]
//        }
//    }
//    return w * h
//}

//(1) 가로길이가 세로길이보다 반드시 길거나 같다
//(2) 가로 길이 중 최대값 * 세로 길이 중 최대값


// MARK: - 더 나은 풀이

func solution(_ sizes:[[Int]]) -> Int {
    var maxNum = 0
    var minNum = 0

    for size in sizes {
        maxNum = max(maxNum, size.max()!)
        minNum = max(minNum, size.min()!)
    }
    return maxNum * minNum
}
