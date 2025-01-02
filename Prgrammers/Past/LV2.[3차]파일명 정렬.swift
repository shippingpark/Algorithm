//
//  LV2.[3차]파일명 정렬.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/10.
//

import Foundation

//파일명 1000개 파일 글자 100개 이하(400바이트) 400KB
//한 글자 씩 100 파일명 1000개 다 훑으면 100,000
//문제 특성상 모든 파일명을 한 자 한 자 훑으며 인덱스 판별 할 일이 없음

func solution(_ files: [String]) -> [String] {
    var files = files

    files = files.sorted { file1, file2 in
        let numStartIndex0 = file1.firstIndex(where: { $0.isNumber })!
        let numStartIndex1 = file2.firstIndex(where: { $0.isNumber })!

        let title0 = file1[..<numStartIndex0].lowercased()
        let title1 = file2[..<numStartIndex1].lowercased()

        if title0 == title1 {
            let numEndIndex0 = file1[numStartIndex0...].firstIndex(where: { !$0.isNumber }) ?? file1.endIndex
            let numEndIndex1 = file2[numStartIndex1...].firstIndex(where: { !$0.isNumber }) ?? file2.endIndex

            let num0 = Int(file1[numStartIndex0..<numEndIndex0])!
            let num1 = Int(file2[numStartIndex1..<numEndIndex1])!

            return num0 < num1
        } else {
            return title0 < title1
        }
    }

    return files
}



//func solution(_ files:[String]) -> [String] {
//    var files = files
//
//    files = files.sorted{
//        var numStartIndex0 = $0.firstIndex(where: {$0.isNumber})!
//        var numStartIndex1 = $1.firstIndex(where: {$0.isNumber})!
//        var title0 = $0[..<numStartIndex0].lowercased()
//        var title1 = $1[..<numStartIndex1].lowercased()
//        if title0 == title1 {
//            var numLastIndex0 = $0[numStartIndex0...].firstIndex(where: {!$0.isNumber})!
//            var numLastIndex1 = $1[numStartIndex1...].firstIndex(where: {!$0.isNumber})!
//            numLastIndex0 = $0[numStartIndex0...].index(numLastIndex0, offsetBy: -1)
//            numLastIndex1 = $1[numStartIndex1...].index(numLastIndex1, offsetBy: -1)
//
//
//            var num1 = Int($0[numStartIndex0...numLastIndex0])!
//            var num2 = Int($1[numStartIndex1...numLastIndex1])!
//
//            guard num1 != num2 else {return title0 < title1}
//
//            return num1 <= num2
//        } else {
//            return title0 < title1
//        }
//    }
//    return []
//}
//print(solution(["AA123", "AA1"]))
//print(solution(["O00321", "O49qcGPHuRLR5FEfoO00321"])) //["O49qcGPHuRLR5FEfoO00321", "O00321"]
//print(solution(["img121234.png", "img121234.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
//print(solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]))

