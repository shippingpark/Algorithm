//
//  File.swift
//  Algorithm
//
//  LV1. 신고 결과 받기
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var idDic:[String:[String]] = Dictionary() //저격 당한 애 : 저격 한 애들 배열
    var result:[Int] = Array(repeating: 0, count: id_list.count)
    
    for i in Set(report) { //중복 신고 제거
        var temp = i.components(separatedBy: " ")
        idDic[temp[1]] = (idDic[temp[1]] ?? []) + [temp[0]]
    }
    
    let banDic = Dictionary(grouping: idDic.filter({
        $0.value.count >= k
    }).values.flatMap({$0}), by: {$0})
    
    for i in id_list.enumerated() {
        if let banArray = banDic[i.element] {
            result[i.offset] = banArray.count
        }
    }
    return result
}

//print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
//
//print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))
