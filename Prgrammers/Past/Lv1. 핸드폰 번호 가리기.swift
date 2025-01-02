

//  Lv1. 핸드폰 번호 가리기


import Foundation

func solution(_ phone_number:String) -> String {
    let count = phone_number.count
    var result = ""
    for (index,Char) in phone_number.enumerated() {
        if index < count - 4 {
            result += "*"
        }
        else { result += "\(Char)" }
    }
    return result
}

