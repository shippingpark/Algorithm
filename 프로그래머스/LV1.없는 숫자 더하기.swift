

//LV1.없는 숫자 더하기

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var count = 0
    for i in 0...9 {
        if !numbers.contains(i) {
            count += i
        } 
    }
    
    return count
}

print(solution([1,2,3,4,6,7,8,0]))
