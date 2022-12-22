

//  LV1.자연수 뒤집어 배열로 만들기

import Foundation

//Int변환 시 기존 값 타입 String 임에 유의 
func solution(_ n:Int64) -> [Int] {
    return String(n).map{Int(String($0))!}.reversed()
}


