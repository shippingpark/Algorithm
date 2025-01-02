

//  옹알이(1)


import Foundation

func solution(_ babbling:[String]) -> Int {
    let canSpeak = ["aya", "ye", "woo", "ma"]
    var count = 0
    for i in babbling {
        for can in canSpeak {
            if i.contains(can) {
                count += 1
                print(i)
            }
        }
    }
    return count
}


print(solution(["aya", "yee", "u", "maa", "wyeoo"]))
