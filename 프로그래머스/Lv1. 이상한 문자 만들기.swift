

//Lv1. 이상한 문자 만들기

import Foundation

func solution(_ s:String) -> String {
    let sArray = s.map{$0}
    return (1...s.count).map{$0 % 2 == 1 ? sArray[$0-1].uppercased() : sArray[$0-1].lowercased()}.reduce(""){$0 + $1}
}

print(solution("try hello world"))
