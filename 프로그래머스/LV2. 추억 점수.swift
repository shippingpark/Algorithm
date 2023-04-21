//
//  LV2. 추억 점수.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/21.
//

import Foundation

// MARK: - 최초 풀이

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var nameYearDic:[String:Int] = [:]
    var result:[Int] = Array(repeating: 0, count: photo.count)
    
    for (index, name) in name.enumerated() {
        nameYearDic[name] = yearning[index]
    }
    
    for (index, photo) in photo.enumerated() {
        for person in photo {
            result[index] += nameYearDic[person] ?? 0
        }
    }
    
        let keyValuePairs = name.indices.map { (key: name[$0], value: yearning[$0]) }
        let dictionary = Dictionary(uniqueKeysWithValues: keyValuePairs)

        print(dictionary)

        var zipqw = zip(name, yearning)



        for i in zipqw {
            print(i)
        }

    return result
}


// MARK: - 개선 풀이

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
}



