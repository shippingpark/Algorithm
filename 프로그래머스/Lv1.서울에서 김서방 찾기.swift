

//  Lv1. 서울에서 김서방 찾기


import Foundation

func solution(_ seoul:[String]) -> String {
    let indexKim = seoul.firstIndex(of: "Kim")
    guard let index = indexKim else {return ""}
    return "김서방은 \(index)에 있다"
}

