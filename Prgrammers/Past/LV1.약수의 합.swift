

//  LV1.약수의 합


import Foundation

// MARK: - 실패 (signal: illegal instruction (core dumped)) 해결 -> 0 포함으로 수정

//func solution(_ n:Int) -> Int {
//    return (0...n).filter { n % $0 == 0 }.reduce(0){ $0 + $1 }
//}


func solution(_ n:Int) -> Int {
    guard n > 0 else {return 0}
    return (1...n).filter { n % $0 == 0 }.reduce(0){ $0 + $1 }
}


// MARK: - 같은 로직 고차함수 X
func solution(_ n:Int) -> Int {
    var count:Int = 0
    guard n > 0 else {return count}
    for i in 1...n {
        if n % i == 0 {
            count += 1
        }
    }
    return count
}



