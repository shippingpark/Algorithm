//
//  LV2.k진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/14.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var array = String(n, radix: k).components(separatedBy: "0")
    var result = 0
    
    array.forEach { numString in
        guard numString != "1" && numString != "" else {return}
        guard isPrime(num: Int(numString)!) else {return}
        result += 1
    }

    return result
}


func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}


