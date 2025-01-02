

//  LV1.문자열 내 p와 y의 개수


import Foundation

// MARK: - 초기 답안

func solution(_ s:String) -> Bool{
    var count:Int = 0

    for char in s {
        if char == "p" || char == "P" {
            count += 1
        }
        else if char == "y" || char == "Y" {
            count -= 1
        }
    }
    return count == 0
}



// MARK: - 다른 풀이 (컴포넌트 사용)
func solution(_ s:String) -> Bool
{
    let string = s.lowercased() //모두 소문자화
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}


print(s.components(separatedBy: "s")) //["", "dg"]

