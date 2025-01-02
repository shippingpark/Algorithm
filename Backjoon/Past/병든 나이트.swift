//
//  병든 나이트.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/15.
//


let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

if N == 1 {
    print(1)
} else if N <= 2 {
    print( min(4, (M-1)/2 + 1) )
} else if M < 7 {
    print( min(4, M) )
} else {
    print(M-2)
}
