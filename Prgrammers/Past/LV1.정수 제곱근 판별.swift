

//  LV1. 정수 제곱근 판별

import Foundation

func solution(_ n:Int64) -> Int64 {
    var sqrtN = sqrt(Double(n))
    if n == Int64(sqrtN) * Int64(sqrtN) {
        return Int64(pow(sqrtN+1, 2))
    }
    return -1
}


