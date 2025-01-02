//
//  단어 공부.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

import Foundation

let input:String = readLine()!
let upperAlphabets: [String] = (65...90).compactMap { String(UnicodeScalar($0)) }
var alphabetsIndex: [String: Int] = Dictionary(uniqueKeysWithValues: upperAlphabets.map { ($0,0) } )

for char in input {
    let search: String = char.uppercased()
    if let count = alphabetsIndex[search] {
        alphabetsIndex[search] = count + 1
    }
}

let maxCount = alphabetsIndex.values.max()

let result = alphabetsIndex.filter { $0.value == maxCount }

if result.count > 1 {
    print("?")
} else {
    print(result.first!.key)
}
