

//  LV1.하샤드 수

import Foundation

func solution(_ x:Int) -> Bool {
    var count = 0
    for i in String(x) {
        count += Int(String(i))!
    }
    return x%count == 0
}

// MARK: - 고차함수 사용

func solution(_ x:Int) -> Bool {
    return x % String(x).map{Int(String($0))!}.reduce(0, +) == 0
}

