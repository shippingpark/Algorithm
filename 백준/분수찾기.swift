//
//  분수찾기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/05.
//

import Foundation

let X: Int = Int(readLine()!)!

var floor:Int = 0
var fullcount = 0

func setStart() {
    for i in 1...X {
        floor += 1 //1 2 3 4
        fullcount += i //1 3 6 10
        if fullcount >= X {
            fullcount -= i
            return
        }
    }
}

setStart()

if floor % 2 == 0 {
    print("\(X-fullcount)/\(floor-(X-fullcount)+1)")
} else {
    print("\(floor-(X-fullcount)+1)/\(X-fullcount)")
}
