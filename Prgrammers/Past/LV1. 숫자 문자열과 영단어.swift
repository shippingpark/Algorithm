//
//  LV1. 숫자 문자열과 영단어.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/02.
//

import Foundation

import Foundation

func solution(_ s:String) -> Int {
    let arr = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var str = s
    for i in 0..<arr.count {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    return Int(str)!
}

// func solution(_ s:String) -> Int {
//     let numberSet:[String: Int] = ["zero" : 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
    
//     var result = ""
//     var word = ""
    
//     for char in s {
//         guard !char.isNumber else {
//             result += String(char)
//             word = ""
//             continue
//         }
        
//         word += String(char)
//         if let number = numberSet[word] {
//             result += String(number)
//             word = ""
//         }
//     }
    
    
//     return Int(result)!
// }
