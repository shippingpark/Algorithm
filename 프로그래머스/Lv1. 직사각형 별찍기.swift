//
//  File.swift
//  Algorithm
//
//  Lv1. 직사각형 별찍기
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
var nLine:String = ""

for _ in 1...a {
    nLine += "*"
}
for _ in 1...b {
    print(nLine)
}



