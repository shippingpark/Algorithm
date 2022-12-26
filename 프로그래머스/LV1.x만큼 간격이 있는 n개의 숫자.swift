

//  LV1.x만큼 간격이 있는 n개의 숫자

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map{Int64($0 * x)}
}
