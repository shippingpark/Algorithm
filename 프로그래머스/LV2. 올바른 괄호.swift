//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/21.
//

import Foundation

func solution(_ s:String) -> Bool {
    var leftcount = 0
    var rightcount = 0
    var result:Bool = true

    for char in s {
        if char == "(" {
            leftcount += 1
        } else if char == ")" {
            rightcount += 1
        }
        guard leftcount >= rightcount else {result = false; break}
    }
//
//    if leftcount != rightcount {
//        result = false
//    }

    return result
}
