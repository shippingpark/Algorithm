//
//  분산처리.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/21.
//


let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = line[0]
    let b = line[1]
    
    var firstOrder = 1
    
    for _ in 0..<b {
        firstOrder = (firstOrder * a) % 10
    }
    
    //print(firstOrder != 0 ? firstOrder : 10)
 
}
