

//  LV1.x만큼 간격이 있는 n개의 숫자

import Foundation

// MARK: - 초기 답안
func solution(_ x:Int, _ n:Int) -> [Int64] {
    var result = Array<Int64>()
    for i in 1...n {
        result.append(Int64(i * x))
    }
    return result
}


// MARK: - 고차함수 활용

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map{Int64($0 * x)}
}
