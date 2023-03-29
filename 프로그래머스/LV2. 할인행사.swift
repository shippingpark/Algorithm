//
//  LV2. 할인행사.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/29.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    var wishList:[String : Int] = {
        var dic:[String:Int] = [:]
        for (i,a) in want.enumerated() {
            dic[a] = number[i]
        }
        return dic
    }()

    for dayIndex in 0...discount.count - 10 {
        var tempDic = wishList
        for i in discount[dayIndex..<dayIndex+10] {
            if tempDic[i] != nil && tempDic[i]! > 0 {
                tempDic[i]! -= 1
            } else {break}
        }
        guard tempDic.values.filter({$0 > 0}).isEmpty else {continue}
        result += 1
    }

    return result
}
