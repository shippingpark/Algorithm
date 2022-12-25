

//  점 찍기

import Foundation


// MARK: - 초기 답안 (실패 : 시간 초과)
func solution(_ k:Int, _ d:Int) -> Int64 {
    var point:Int64 = 0

    for i in 0...d {
        var x = k*i
        for j in 0...d {
            var y = k*j
            if x*x + y*y <= d*d {
                point += 1
            }
        }
    }
    return point
}


// MARK: - 중첩 for 문 피하기

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result:Int64 = 0
    var point:[Int] = []
    
    for i in stride(from: 0, through: d, by: k){
        point.append(i)
    }
    
    //최소 0으로 확정, 최댓값 구하는 과정
    let fullLineCount:Int = point.count
    
    //줄 당 몇 개 인지 찾기
    for eachPoint in point {
        var x = point.last!
        var y = eachPoint
        var outPoint:Int = 0
        //피타고라스 밖의 점이면
        while !checkInnerCircle(x: x, y: y, d: d){
//            print("실패 좌표 (\(x),\(y))이고 아웃 카운트는 \(outPoint)")
            x -= k
            guard x >= 0 else {x += k; return result}
            outPoint += 1
        }
        
//        print("성공 좌표 (\(x),\(y))이고 아웃 카운트는 \(outPoint)")
        result += Int64(fullLineCount - outPoint)
    }

    return result
}


func checkInnerCircle(x:Int, y:Int, d:Int) -> Bool {
    var check:Bool = false
    if x*x + y*y <= d*d {
        check = true
    }
    return check
}



print(solution(2, 4))//6
print(solution(1, 5))//26

