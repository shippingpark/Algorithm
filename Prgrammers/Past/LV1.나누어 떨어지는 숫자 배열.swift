

//  LV1.나누어 떨어지는 숫자 배열

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result:[Int] = []
    for i in arr {
        if i%divisor == 0 {
            result.append(i)
        }
    } 
    
    if result.count == 0 {
        return [-1]
    }
    
    return result.sorted()
}

print(solution([5,9,7,10], 5))
