//
//  LV2. 문자열 압축.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/28.
//

import Foundation

func solution(_ s:String) -> Int {
    var s:[String] = s.map{ String($0) }
    var minLength: Int = Int.max
    
    func checkLength(count: Int, length: Int) {
        if count > s.count {
            minLength = length
            return
        }
        var word:[String] = []
        var 중복: [String:Int] = [:]
        var len = 0

      for i in stride(from:0, to:s.count, by:count) {//시작 인덱스 i
            let j = i+count > s.count ? s.count : i+count//마지막 인덱스 j, 범위 초과 방지
            let now:[String] = Array(s[i..<j]) //배열 형태로 비교

            if word.isEmpty { //비교 word가 비어 있다면
                word = now
                len += count
            } else if word == now { //비교 word와 현재 배열 now가 같다면
                중복[word.joined(), default: 1] += 1 //중복 count ++
                continue
            } else { //비교 word 값이 있는데, 현재 배열 now와 다를 경우
                  if word.count != now.count {
                      len += now.count //비교값과 현재값의 길이가 다르다면 현재값 길이 더해줌, 딱 나누어 떨어지지 않는 상황
                  } else {
                      len += count //생긴 비교값 길이만큼 더해주고
                  }
                  word = now //비교값 교체
                  len += 중복.values.map{ String($0).count }.reduce(0, +)//분리된 구간의 중복된 문자 체크 문제 방지
                  중복 = [:]//한 문자에 대한 체크 종료 후 중복 초기화, 딕셔너리로 만들 필요 없었음
              }
          }
        len += 중복.values.map{ String($0).count }.reduce(0, +) //마지막 비교가 중복이었다면, 반복문 종료 이후 삽입 처리
        checkLength(count: count+1, length: min(length, len))
    }
    
    checkLength(count: 1, length: minLength) //1부터 s.count 까지 반복

    return minLength
}



// MARK: - 잘못된 풀이

//func solution(_ s:String) -> Int {
//    var result = Int.max
//
//    for jump in 0...(s.count-1) {
//        //var sArray:[String] = s.map{ String($0) }
//        var sArray = s.map{String($0)}
//        var newArray:[String] = []
//        var start = 0
//        while start < sArray.count - jump - 1 {
//            let word = sArray[start...(start+jump)].joined()
//            newArray.append(word)
//
//            start += jump + 1
//        }
//
//        if start < sArray.count {
//            newArray.append(sArray[start...].joined())
//        }
//
//        result = min(result, checkEquaulCount(newArray))
//
//    }
//
//    return result
//}
//
//func checkEquaulCount(_ array:[String]) -> Int {
//    var newS = array[0]
//    var 중복:Bool = false
//
//    for i in 1..<(array.count) {
//        var before: String = array[i-1]
//        var now: String = array[i]
//
//        if now == before {
//            if 중복 {
//                continue
//            } else {
//                newS += "0"
//                중복 = true
//            }
//
//        } else {
//            newS += now
//            중복 = false
//        }
//    }
//    return newS.count
//}
//
