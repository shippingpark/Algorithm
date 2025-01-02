//
//  덩치.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/05.
//

import Foundation

typealias PersonInfo = (weight: Int, height: Int)

let personCount: Int = Int(readLine()!)!
var infoList: [PersonInfo] = []
var result: [Int] = []

for _ in 1...personCount {
    let info = readLine()!.split(separator: " ").map{ Int(String($0))! }
    infoList.append(PersonInfo(weight: info.first!, height: info.last!))
}

for i in 0..<personCount {
    var prize = 1
    let now = infoList[i]
    var withoutNowInfoList = infoList
    withoutNowInfoList.remove(at: i)
    
    for info in withoutNowInfoList {
        if (now.height < info.height) && (now.weight < info.weight) {
            prize += 1
        }
    }
    
    result.append(prize)

}

//print(result.map{String($0)}.joined(separator: " "))
