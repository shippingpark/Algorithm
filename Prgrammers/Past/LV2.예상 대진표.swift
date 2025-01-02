//
//  LV2.예상 대진표.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/28.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var A = Double(a)
    var B = Double(b)
    for i in 1...20 {
        A = round(A / 2)
        B = round(B / 2)
        if A == B { return i }
    }
    
    return 0
}
