//
//  LV2.주차 요금 계산 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/03.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let records:[[String]] = records.map{$0.components(separatedBy: " ")}
    var inRecords:[String:String] = [:] //차량번호:입차시간
    var timeRecords:[String:Int] = [:] //차량 번호:누적시간
    let allCarNum:Set<String> = Set(records.map{$0[1]}) //중복 없이 차량번호만 모으기
    var result:[Int] = []
    
    for car in records { //1) 나가는 차량이라면, inRecords에서 입차시간을 확인하고 시간을 확인하여 timeRecords에 사용 시간을 누적한다 //2)들어오는 차량이라면 inRecords에 차량과 입차 시간을 넣어주고 continue
        guard car[2] == "OUT" else {inRecords[car[1]] = car[0]; continue} //이 아래는 출차 차량에 대한 계산 (출차 차량 기록은 곧 입차 차량 기록이 존재한다는 뜻)
        let start = convertToMinutes(time: inRecords[car[1]]!)
        let finish = convertToMinutes(time: car[0])
        timeRecords[car[1]] = (timeRecords[car[1]] ?? 0) + (finish! - start!)
        inRecords.removeValue(forKey: car[1]) //계산 후 입차 기록에서 제거
    }

    for i in inRecords { //만약, 출차 시간이 없어서 지워지지 않은 입차 기록이 있다면
        let start = convertToMinutes(time: i.value)
        let finish = convertToMinutes(time: "23:59") //출차 시간을 가이드에 따라 삽입
        timeRecords[i.key] = (timeRecords[i.key] ?? 0) + (finish! - start!)
    }
    
    for car in allCarNum.sorted(by: <) { //총 차량을 번호 작은 순서대로
        let time:Int = timeRecords[car]!
        var addFee = 0
        if time > fees[0] { //기본 시간보다 크면 추가요금 계산
            addFee = Int(ceil(Double((timeRecords[car] ?? 0) - fees[0]) / Double(fees[2]))) * fees[3]
        }
        result.append(addFee + fees[1]) //추가요금 + 기본요금
    }

    return result
}

func convertToMinutes(time: String) -> Int? { //String 형태 분단위로 변환 메서드 //ChatGpt 도움
    let timeComponents = time.split(separator: ":")
    if let hours = Int(timeComponents[0]), let minutes = Int(timeComponents[1]) {
        let totalMinutes = hours * 60 + minutes
        return totalMinutes
    } else {
        return nil
    }
}
