//
//  크리스마스 선물.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/10.
//

import Foundation

let n: Int = Int(readLine()!)!
var presents: [Int] = []

for _ in 0..<n {
    var input: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if input[0] == 0 { //선물 배포지라면
        if let present = presents.popLast() {
            print(present)
        } else {
            print("-1")
        }
    } else { //선물 충전지 라면
        input.removeFirst()
        presents.append(contentsOf: input)
        presents.sort(by: <) //가장 좋은 선물
    }
}
