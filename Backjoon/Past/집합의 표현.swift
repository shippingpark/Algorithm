//
//  집합의 표현.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/12.
//

import Foundation

// MARK: - 집합의 표현

var parent: [Int] = []

func solution() {
    guard let nm = readLine()?.split(separator: " ").compactMap({Int(String($0))}),
        let n = nm.first,
        let m = nm.last else {return}
    
    parent = Array(0...n)
    
    for _ in 0..<m {
        guard let input = readLine()?.split(separator: " ").compactMap({Int(String($0))}),
            let type = input.first,
            let a = input.dropFirst().first,
            let b = input.dropFirst(2).first else {return}
        
        if type == 0 {
            union(a, b)
        } else {
            if find(a) == find(b) {
                print("YES\n")
            } else {
                print("NO\n")
            }
        }
    }
}

func union(_ a:Int, _ b:Int) {
    let x = find(a)
    let y = find(b)
    parent[x] = y
}

func find(_ a: Int) -> Int {
    guard parent[a] != a else {return a}
    
    parent[a] = find(parent[a])
    return parent[a]
    
}

solution()
