

//  LV1.자릿수 더하기

import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    for i in String(n) {
        answer += Int(String(i))!
    }
    return answer
}
