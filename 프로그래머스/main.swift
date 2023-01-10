

//  LV1. 두 개 뽑아서 더하기

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var array:[Int] = []
    
    for (index, num) in numbers.enumerated() {
        var mapArray = numbers[index...numbers.count-1].map{ $0 + num }
        mapArray.removeFirst()
        array += mapArray
    }

    return Set(array).sorted()
}

print(solution([2,1,3,4,1]))


