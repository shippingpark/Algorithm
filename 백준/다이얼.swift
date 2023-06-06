//
//  다이얼.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

let input: String = readLine()!
let upperAlphabets: [Character] = (65...90).compactMap { Character(UnicodeScalar($0)) }
let alphabetsOrder = Dictionary(uniqueKeysWithValues: zip(upperAlphabets, upperAlphabets.indices))
var sum = 0

for char in input {
    switch alphabetsOrder[char]! {
    case 0...14: sum += (alphabetsOrder[char]! / 3) + 3
    case 15...18: sum += 8
    case 19...21: sum += 9
    default:
        sum += 10
    }
}

print(sum)
