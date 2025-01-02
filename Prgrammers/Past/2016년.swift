//
//  2016년.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/31.
//

import Foundation

// MARK: - 수정 풀이

func solution(_ a:Int, _ b:Int) -> String {
    let week = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let total = days[0..<(a-1)].reduce(0, +) + b
    
    return week[total % 7]
}


// MARK: - 처음 풀이

//func switchMonthToDays(month: Int) -> Int {
//    switch month {
//        case 1, 3, 5, 7, 8, 10, 12: return 31
//        case 2: return 29
//        case 4, 6, 9, 11: return 30
//        default: return 0
//    }
//}
//
//func solution(_ a:Int, _ b:Int) -> String {
//    var totalDays = b
//
//    for month in 1..<a {
//        totalDays += switchMonthToDays(month: month)
//    }
//
//    switch totalDays % 7 {
//        case 0: return "THU"
//        case 1: return "FRI"
//        case 2: return "SAT"
//        case 3: return "SUN"
//        case 4: return "MON"
//        case 5: return "TUE"
//        case 6: return "WED"
//        default: return ""
//    }
//}
