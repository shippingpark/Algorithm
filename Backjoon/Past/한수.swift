//
//  한수.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/01.
//


let number:Int = Int(readLine()!)!

if number <= 99 {
    print(number)
} else {
    var result = 99
    for i in 100...number {
        var arr = Set<Int>()
        let n = String(i).map {Int(String($0))!}
        
        for j in 1..<n.count {
            arr.insert(n[j] - n[j-1])
        }
        if arr.count == 1 {result += 1}
    }
    print(result)
}
