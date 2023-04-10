

//  프로그래머스 디펜스 게임


import Foundation

//n 병사 수
//k 디펜스 수
//enemy 라운드 별 적군 수

// MARK: - 3,6,7,8,9,10 시간초과
// MARK: - sort 하지 않고 max로 접근 : 3,6,7,8,9 시간초과
//heap으로 푸는 게 필수 불가결 해 보임

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var k = k
    var n = n
    var result = 0
    var clearRound: [Int] = [] //heap 대용 배열
    
    for currentRound in enemy {
        clearRound.append(currentRound)
//        clearRound.sort(by: <)
        
        if n >= currentRound {
            n -= currentRound
        } else if k > 0 {
            if let max = clearRound.max() {
                clearRound.remove(at: clearRound.firstIndex(of: max)!)
                n += max
                n -= currentRound
            }
            k -= 1
        } else {
            break
        }
        
        result += 1
    }
    
    
    return result
}


print(solution(2,4,[3,3,3,3]))//4
print(solution(7,3,[4,2,4,5,3,3,1]))//5
print(solution(1,3,[1,1,1,1,3,3,1]))//4
print(solution(4,1,[4,4,4,5,3,3,1]))//2
print(solution(5,2,[1,2,1,3,3,3,1]))//5
print(solution(5,2,[1,2,1,3,3,3,1]))//5
print(solution(4,1,[4,2,2]))//3


//func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
//    var clearRound:Int = 0
//    var defense:Int = k
//    var user:Int = n
//    var cropEnemy:[Int] = enemy
//
//    while user > 0 {
//        //1) 남은 라운드 총 합이 유저 수 보다 적으면 끝
//        if checkClear(user, cropEnemy) {
//            clearRound += cropEnemy.count
//            return clearRound
//        }
//
//        //2) 방어권이 없다면 (-) 되기 전에 종료
//        if defense == 0 {
//            for eachRound in cropEnemy {
//                guard user != 0 else {return clearRound}
//                guard user > 0 else {return clearRound - 1}
//                user -= eachRound
//                clearRound += 1
//            }
//            return clearRound
//        }
//
//            //3) 방어권이 있다면
//            //3-1) cropEnemy의 합이 음수가 되는 index 불러오기
//            let minusSumIndex = searchArangeIdex(user, cropEnemy)
//            let plusSumIndex = minusSumIndex - 1
//            //3-2) 사용 후 user 값 계산하기
//            var testEnemy = cropEnemy[0...minusSumIndex]
////            print("프린트 마이너스 인덱스 \(minusSumIndex)")
//            let maxRound = testEnemy.max()! //삭제할 최대 값
//            user = user - testEnemy.reduce(0,{$0+$1}) + maxRound
////            print("\(user) = user - \(testEnemy.reduce(0,{$0+$1})) + \(maxRound)")
//            //3-3) 지난 라운드 만큼 배열 줄이기
//            cropEnemy.removeSubrange(0...minusSumIndex)
//            clearRound += minusSumIndex + 1
//            defense -= 1
//
//    }
//
//    return clearRound
//}
//
//
//// MARK: - 디펜스 안해도 되는 지
//func checkClear (_ n:Int, _ enemy:[Int]) -> Bool {
//    if n >= enemy.reduce(0, {$0+$1}) {
//        return true
//    }
//    return false
//}
//
//
//// MARK: - 디펜스 해야할 때
////우리 병사 수가 양수가 아니게 되는 최대 index
//func searchArangeIdex (_ n:Int, _ enemy:[Int]) -> Int {
//    var maximumIdex = -1
//    var totalEnemyCount = 0
//    for eachEnemy in enemy {
//        guard totalEnemyCount < n else {return maximumIdex}
//        totalEnemyCount += eachEnemy
////        print("enemy, totalEnemyCount:\(enemy),\(totalEnemyCount)")
//        maximumIdex += 1
//    }
//    return maximumIdex
//}


print(solution(2,4,[3,3,3,3]))//4
print(solution(7,3,[4,2,4,5,3,3,1]))//5
print(solution(1,3,[1,1,1,1,3,3,1]))//4
print(solution(4,1,[4,4,4,5,3,3,1]))//2
print(solution(5,2,[1,2,1,3,3,3,1]))//5
print(solution(5,2,[1,2,1,3,3,3,1]))//5
print(solution(4,1,[4,2,2]))//3

