//
//  LV2. 방문길이.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/07.
//

import Foundation

func solution(_ dirs:String) -> Int {
    var moveline = Set<[Int]>()
    var user = (0,0)
    
    func moveLength(dir:Character) -> (Int, Int) {
        switch dir {
        case "U": return (0,1)
        case "D": return (0,-1)
        case "R": return (1,0)
        case "L": return (-1,0)
        default: return (0,0)
        }
    }
    
    for dir in dirs {
        var new = user
        let move = moveLength(dir: dir)
        new.0 += move.0
        new.1 += move.1
        
        guard new.0 >= -5 && new.0 <= 5 && new.1 >= -5 && new.1 <= 5 else {continue}
        if !moveline.contains([new.0, new.1, user.0, user.1]) {
            moveline.insert([new.0, new.1, user.0, user.1])
            moveline.insert([user.0, user.1, new.0, new.1])
        }
        user = new
    }
    
    return moveline.count / 2
}

//func solution(_ dirs:String) -> Int {
//    var myMove:[Position:[Character]] = [:]
//    var currentPosition:Position = Position(x: 0, y: 0)
//    var result = 0
//
//    for dir in dirs {
//        guard currentPosition.canMove(dir) else {continue}
//        var movePosition = currentPosition
//        movePosition.move(dir)
//        if myMove.keys.contains(movePosition) { //움직일 좌표에 대한 정보가 존재한다면
//            var values = myMove[movePosition]! //어떤 방향이 있는 지
//            guard !values.contains(dir) else {currentPosition.move(dir); continue} //이미 있는 방향인지
//            //없으면
//            values.append(dir) //추가하고
//            myMove[movePosition] = values //초기화
//            myMove[currentPosition] = oppositeDir(values) //내 위치로 오는 반대 경로도 추가
//        } else {
//            myMove[movePosition] = Array(arrayLiteral: dir)
//            myMove[currentPosition] = oppositeDir(Array(arrayLiteral: dir))
//        }
//        currentPosition.move(dir)
//        result += 1
//    }
//
//    return result
//}

//func oppositeDir(_ values: [Character]) -> [Character] {
//    var array:[Character] = []
//    for dir in values {
//        switch dir {
//        case "U":
//            array.append("D")
//        case "D":
//            array.append("U")
//        case "R":
//            array.append("L")
//        case "L":
//            array.append("R")
//        default:
//            break
//        }
//    }
//
//    return array
//}
//
//
//struct Position : Hashable {
//    var x:Int
//    var y:Int
//
//    func canMove(_ dir: Character) -> Bool {
//        switch dir {
//        case "U":
//            return y != 5
//        case "D":
//            return y != -5
//        case "R":
//            return x != 5
//        case "L":
//            return x != -5
//        default:
//            return false
//        }
//    }
//
//    mutating func move(_ dir: Character){
//        switch dir {
//        case "U":
//            self.y += 1
//        case "D":
//            self.y -= 1
//        case "R":
//            self.x += 1
//        case "L":
//            self.x -= 1
//        default:
//            break
//        }
//    }
//}
