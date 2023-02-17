//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/17.
//

import Foundation

// MARK: - LV2. JadenCase 문자열 만들기

func solution(_ s:String) -> String {
    var result:[String] = s.components(separatedBy: " ")
    
    result = result.map{ word in
        var result = word.lowercased()
        if (word.first?.isLetter) == Optional(true) {
            result = result.capitalized
//            result.removeFirst()
//            result = (word.first?.uppercased())! + result
        }
        return result
    }
    return result.joined(separator: " ")
}


