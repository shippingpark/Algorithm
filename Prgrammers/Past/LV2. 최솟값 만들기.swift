//
//  main.swift
//  LV2. 최솟값 만들기
//  Created by 박혜운 on 2023/02/21.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let A = A.sorted(by: >)
    let B = B.sorted(by: <)

    return (0...A.count-1).map{A[$0] * B[$0]}.reduce(0, +)
}


