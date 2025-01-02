

//  Lv1. 제일 작은 수 제거하기


import Foundation

// MARK: - 시간초과

func solution(_ arr:[Int]) -> [Int] {
    var resultArr = arr
    return arr.count > 1 ? resultArr.filter(){$0 != arr.min()!} : [-1]
}


// MARK: - 시간초과 안나는 풀이 (하지만 장황)

func solution(_ arr:[Int]) -> [Int] {
    var resultArr = arr
    var minIndex = 0
    var oldvlaue = arr[0]
    guard arr.count > 1 else {return [-1]}
    for (i, a) in arr.enumerated() {
        if a < oldvlaue {
            oldvlaue = a
            minIndex = i
        }
    }
    resultArr.remove(at: minIndex)
    return resultArr
}


// MARK: - 고차함수 활용 풀이 (compactMap)
//compactMap : nil이면 지운다 (확신할 수 없는 값 : 옵셔널이면 삭제)

func solution(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
     return arr.count == 1 ? [-1] : arr.compactMap{ $0 != min ? $0 : nil }
}


// MARK: - 고차함수 활용 풀이 (filter)

func solution(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
    return arr.count == 1 ? [-1] : arr.filter{$0 != min}
}

