//
//  Lv2.쿼드 압축 후 개수 세기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/28.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var result = [0,0]

    func divide(size: Int, y: Int, x: Int) {
        let n = arr[y][x]

        for i in y..<y+size {
            for j in x..<x+size {

                if arr[i][j] != n {
                    let half = size / 2

                    for ii in 0..<2 {
                        for jj in 0..<2 {
                            divide(size: half, y: y + ii * half, x: x + jj * half)
                        }
                    }

                    return
                }
            }
        }
        result[n] += 1
    }
    divide(size: arr.count, y: 0, x: 0)
    return result
}

//func solution(_ arr:[[Int]]) -> [Int] {
//    let max = arr.count
//    var rectangleLen:Int = max
//
//
//nextSize: while rectangleLen != 0 {
//    var start = (r: 0,c: 0)
//    print("rectangleLen : \(rectangleLen)")
//nextArea: for r in start.r...(start.r + rectangleLen - 1) {
//
//    guard start.r != max else {continue nextSize}
//        print("r position : \(r)")
//        for c in start.c...(start.c + rectangleLen - 1) {
//            guard start.c != max else {continue nextArea}
//            print("c position : \(c)")
//            }
//        start.c += rectangleLen
//        }
//    start.r += rectangleLen
//    rectangleLen /= 2
//    }
//
//
//
//    return []
//}

print(solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]])) //[4,9]
//최대 사각형 길이 = array.count
//while 최대사각형 길이 != 0 {
//    4 -> 2 -> 1 -> 0일 때 종료
//    (0,0)
//    for r 시작점...최대사각형 길이 - 1 {
//        0...1
//        for c 시작점 ... 최대사각형 길이 - 1.{
//            0...1
//            2...3
//        }
//    }
//    최대사각형 길이 /= 2
//}
