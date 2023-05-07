//
//  Lv1.이상한 문자 만들기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/07.
//

import Foundation

func solution(_ s:String) -> String {
    var sArray = s.components(separatedBy: " ")
    var index = 0
    
    for word in sArray {
        var new = ""
        var upper = true
        for char in word {
            new += upper ? char.uppercased() : char.lowercased()
            upper.toggle()
        }
        sArray[index] = new
        index += 1
    }
    
    return sArray.joined(separator: " ")
}
