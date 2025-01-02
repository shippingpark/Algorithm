

//  Lv1.숫자 짝꿍

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var standardNumber: [Character:Int] = [:]
    var resultValue = [Int](repeating: 0, count: 10)
    var result:String = ""
    
    for x in X {
        guard standardNumber[x] != nil else {standardNumber[x] = 1; continue}
        standardNumber[x]! += 1
    }
    
    for y in Y {
        guard standardNumber[y] != nil else {continue}
        guard standardNumber[y] != 0 else {continue}
        resultValue[Int(String(y))!] += 1
        standardNumber[y]! -= 1
    }
    
    if resultValue.reduce(0, {$0 + $1}) == 0 {
        return "-1"
    }
    
    for myIndex in 0...9 {
        guard resultValue[9-myIndex] != 0 else {continue}
        var count = resultValue[9-myIndex]
        for _ in 1...count {
            result += "\(9-myIndex)"
        }
    }
    
    if result.first == "0" {
        return "0"
    }
    
    return result
}


