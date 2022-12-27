

//  Lv0.문자열 계산하기

import Foundation


// MARK: - strArry[i*2+1]에 따라  strArry[i*2] 더 할지 뺄 지

func solution(_ my_string:String) -> Int {
    let strArry = my_string.components(separatedBy: " ")
    let index = strArry.count - 1
    var result = Int(strArry[0])! //첫번째 수
    
    for i in 1...index/2 {
        if strArry[2*i-1] == "+" {
            result += Int(strArry[2*i])!
        }
        else if strArry[2*i-1] == "-" {
            result -= Int(strArry[2*i])!
        }
    }
    
    return result
}

print(solution("3 + 4 - 1"))


// MARK: - "Str".replacingOccurrences(of: <#T##Target#>, with: <#T##Replacement#>)

