//
//  두 수의 합.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/07.
//

import Foundation

func solution(_ a:String, _ b:String) -> String {
    var a = a
    var b = b
    let maxCount: Int = max(a.count, b.count)
    var array: [String] = Array(repeating: "", count: 100001)
    var plus: Int = 0
    
    for i in 0...maxCount {
        let aa: Int = Int(String(a.popLast() ?? "0"))!
        let bb: Int = Int(String(b.popLast() ?? "0"))!
        
        array[100000 - i] = String((aa + bb + plus) % 10)
        plus = (aa + bb + plus) / 10
    }
    
    if array[100000 - maxCount] == "0" {
        array[100000 - maxCount] = ""
    }
    
    
    return array.joined()
}
