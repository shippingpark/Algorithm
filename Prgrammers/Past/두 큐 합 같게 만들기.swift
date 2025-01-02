//
//  두 큐 합 같게 만들기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/24.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1:[Int] = queue1
    var queue2:[Int] = queue2
    var sum1:Int = queue1.reduce(0, +) //얘는 시간복잡도에 치명적 X
    var sum2:Int = queue2.reduce(0, +)
    var queue1Count = queue1.count
    var queue2Count = queue2.count
    var fullCount = queue1Count + queue2Count
    var index1 = 0
    var index2 = 0
    guard (sum1 + sum2) % 2 == 0 else {return -1}
    let goalSum = (sum1 + sum2) / 2
    var count:Int = 0
    
    //없어도 풀림, 있으면 시간복잡도 줄긴 줆
     if goalSum < queue1.max()! || goalSum < queue2.max()! {
             return -1
         }
    
    while sum1 != goalSum {
        if sum1 > sum2 {
            guard index1 < (queue1Count-1) else {return -1} //제일 큰 큐가 한 개의 요소만 갖는다면
            guard index1 < fullCount else {return -1}//⭐️반대 쪽 다 끌어왔는데도 여전히 완성 안됐다면
            let pop1 = queue1[index1] //인덱스로 pop
            sum1 -= pop1 //팝 했으므로 전체 합에서 제거
            index1 += 1 //첫번째 인덱스 하나 밀림 (pop했으니까)
            queue2.append(pop1) //queue2에 추가
            queue2Count += 1 //전체 길이 증가 (배열.count 해주지 않기 위한 수단)
            sum2 += pop1 //합산
        } else {
            guard index2 < (queue2Count-1) else {return -1}
            guard index2 < fullCount else {return -1}//⭐️반대 쪽 다 끌어왔는데도 여전히 완성 안됐다면
            let pop2 = queue2[index2]
            sum2 -= pop2
            index2 += 1
            queue1.append(pop2)
            queue1Count += 1
            sum1 += pop2
        }
        count += 1
    }

    return count
}

// MARK: - 시간초과
//
//func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    var queue1:[Int] = queue1
//    var queue2:[Int] = queue2
//    var sum1:Int = {
//        var sum = 0
//        for i in queue1 {
//            sum += i
//        }
//       return sum
//    }()
//    var sum2:Int = {
//        var sum = 0
//        for i in queue2 {
//            sum += i
//        }
//       return sum
//    }()
//    var queue1Count = queue1.count
//    var queue2Count = queue2.count
//    var index1 = 0
//    var index2 = 0
//    guard (sum1 + sum2) % 2 == 0 else {return -1}
//    let goalSum = (sum1 + sum2) / 2
//
//    if goalSum < queue1.max()! || goalSum < queue2.max()! {
//            return -1
//        }
//
//    var count:Int = 0
//
//    while sum1 != goalSum {
//        if sum1 > sum2 {
//            guard index1 < (queue1Count-1) else {return -1} //제일 큰 큐가 한 개의 요소만 갖는다면
//            let pop1 = queue1[index1] //인덱스로 pop
//            sum1 -= pop1 //팝 했으므로 전체 합에서 제거
//            index1 += 1 //첫번째 인덱스 하나 밀림 (pop했으니까)
//            queue2.append(pop1) //queue2에 추가
//            queue2Count += 1 //전체 길이 증가 (배열.count 해주지 않기 위한 수단)
//            sum2 += pop1 //합산
//        } else {
//            guard index2 < (queue2Count-1) else {return -1}
//            let pop2 = queue2[index2]
//            sum2 -= pop2
//            index2 += 1
//            queue1.append(pop2)
//            queue1Count += 1
//            sum1 += pop2
//        }
//        count += 1
//    }
//
//    return count
//}
