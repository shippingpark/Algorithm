//
//  File2.swift
//  Algorithm
//
//  LV1. 크기가 작은 부분 문자열
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let pLength = p.count
    let tLength = t.count
    var tArray:[String] = []
    
    (0...tLength-pLength).forEach{
        tArray.append(t.map{String($0)}[$0...$0+pLength-1].joined())
    }
    print(tArray)
    return tArray.filter{Int($0)! <= Int(p)!}.count
}



//일단!!! pString을
print(solution("3141592", "271")) //2
print(solution("500220839878", "7")) //8

print(solution("10203", "15")) //3


