//
//  LV2. [1차] 뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/22.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let arr1 = str1.map{String($0)}
    let arr2 = str2.map{String($0)}
    
    var arr11: [String] = {
        var arr:[String] = []
        for i in 0...arr1.count-2 {
            let word: String = arr1[i...i+1].joined()
            if isEnglishOnly(word) {
                arr.append(word.lowercased())
            } else {
                continue
            }
        }
        return arr
    }()
    
    let arr22:[String] = {
        var arr:[String] = []
        for i in 0...arr2.count-2 {
            let word:String = arr2[i...i+1].joined()
            if isEnglishOnly(word) {
                arr.append(word.lowercased())
            } else {
                continue
            }
        }
        return arr
    }()
    
    var 기준:[String] = []
    var 비교:[String] = []
    
    
    if arr11.count > arr22.count { //작은게 비교
        기준 = arr22
        비교 = arr11
    } else {
        기준 = arr11
        비교 = arr22
    }
    
    var intersection:Double = 0
    
    for i in 기준 {
        if 비교.contains(i) {
            intersection += 1
        }
    }
    
    let union = Double(arr11.count + arr22.count) - intersection

    return union == 0.0 ? 65536 : Int((intersection/union) * 65536)
}


func isEnglishOnly(_ string: String) -> Bool {
    let letters = CharacterSet.letters
    return string.rangeOfCharacter(from: letters.inverted) == nil
}
