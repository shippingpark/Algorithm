

//  Lv0. 팩토리얼


import Foundation

//func solution(_ n:Int) -> Int {
//    guard n > 1 else {return 1}
//    var cal:Int = 1
//    var i:Int = 1
//    while n > cal {
//        i += 1
//        cal *= i
//    }
//    return cal
//}


// MARK: - 단순 대소 비교로 문제 해결

func solution(_ n:Int) -> Int {
    guard n > 1 else {return 1}
    var cal:Int = 1
    var i:Int = 1
    
    while n >= cal {
        i += 1
        cal *= i
    }
    return i - 1
}
