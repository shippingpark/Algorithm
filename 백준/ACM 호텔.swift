//
//  호텔.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

let inputRepeat: Int = Int(readLine()!)!

for _ in 1...inputRepeat {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let H: Int = input[0]
    let W: Int = input[1]
    let N: Int = input[2]
    
    let floor = (N % H == 0) ? H : N % H
    let room = ((N-1)/H) + 1
    
    if String(room).count == 1 {
        print("\(floor)0\(room)")
    } else {
        print("\(floor)\(room)")
    }
}
