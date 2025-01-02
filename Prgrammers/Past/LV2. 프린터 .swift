//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/21.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var arr = priorities
    var max = arr.max()!
    var pointer = 0 //계속 arr를 반복해서 도는
    var count = 1
    
    while true {
        let point = pointer % priorities.count //값을 나눔으로서 pointer가 총 길이를 초과해도 올바른 값을 가르키도록 함
        if arr[point] == max {
            if point == location { //현재 가르키는 위치와 내가 알고 싶은 문서 위치가 같다면 종료
                break
            } else { //아니라면
                arr[point] = 0 //현재 최대값을 없애고
                count += 1 // 순서가 하나 지나고
                max = arr.max()! //최대값 리셋
            }
        }
        pointer += 1 //포인터 증가
    }
    return count
}


