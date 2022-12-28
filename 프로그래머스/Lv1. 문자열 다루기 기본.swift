

//  Lv1. 문자열 다루기 기본


import Foundation

func solution(_ s:String) -> Bool {
    let strCount = s.count
    guard strCount == 4 || strCount == 6 else {return false}
    return strCount == s.map{Int(String($0))}.compactMap{$0}.count
}


