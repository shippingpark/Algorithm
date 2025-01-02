//
//  크로아티아 알파벳.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/05.
//

import Foundation

let keys: [String] = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

var inputString: String = readLine()!
var count = 0

for key in keys {
    let beforeCount = inputString.count
    inputString.replacingOccurrences(of: key, with: "")
    count += inputString.count != beforeCount ? 1 : 0
}

print(count)
