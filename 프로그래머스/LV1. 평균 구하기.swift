

//  LV1. 평균 구하기

import Foundation

func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}
