

//  LV1.콜라츠 추측

//1-1. 입력된 수가 짝수라면 2로 나눕니다.
//1-2. 입력된 수가 홀수라면 3을 곱하고 1을 더합니다.
//2. 결과로 나온 수에 같은 작업을 1이 될 때까지 반복합니다. 

import Foundation

// MARK: - 초기 답안

func solution(_ num:Int) -> Int {
    var inputNum = num
    var count = 0
    while inputNum != 1 {
        guard count < 500 else { return -1 }
        count += 1
        if inputNum%2 == 0 {
            inputNum /= 2
        }
        else {
            inputNum = 3*inputNum + 1
        }
    }
    return count
}


// MARK: - 가독성 개선 (삼항 연산자)

func solution(_ num:Int) -> Int {
    var inputNum = num
    var count = 0
    while inputNum != 1 {
        guard count < 500 else { return -1 }
        inputNum = (inputNum % 2 == 0) ? (inputNum / 2) : (3 * inputNum + 1)
        count += 1
    }
    return count
}


