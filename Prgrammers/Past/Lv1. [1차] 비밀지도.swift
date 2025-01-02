

// Lv1. [1차] 비밀지도

import Foundation

// MARK: - 실패 (signal: illegal instruction (core dumped))

//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//
//    let arrBit1:[UInt8] = arr1.map{UInt8($0)}
//    let arrBit2:[UInt8] = arr2.map{UInt8($0)}
//    var arrBit = (0...n-1).map{Int(String(arrBit1[$0] | arrBit2[$0],radix: 2))!}
//
//    return arrBit.map{
//        String(format: "%0\(n)ld", $0).map{$0 == "0" ? " " : "#"}.joined()
//    }
//}



func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    let arrBit1:[Int] = arr1.map{Int(String($0,radix: 2))!}
    let arrBit2:[Int] = arr2.map{Int(String($0,radix: 2))!}
    var arrBit = (0..<n).map{arrBit1[$0] + arrBit2[$0]}
    var result = arrBit.map{ i in
        String(format: "%0\(n)ld", i).map{$0 == "0" ? " " : "#"}.joined()
    }
    return result
}
    
