//
//  File.swift
//  Algorithm
//
//  LV1.키패드 누르기
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let numL = [1, 4, 7, -1] //-1 == *
    let numM = [2, 5, 8, 0]
    let numR = [3, 6, 9, -2] //-2 == #
    var nowLIndex = 3 //*
    var nowRIndex = 3 //#
    var leftHandChanged = false
    var rightHandChanged = false
    
    let myhand: String = {
    switch hand {
    case "right": return "R"
    case "left": return "L"
    default:
        return "R"
    }
    }()
    
    
    func numIndex(num:Int) -> String {
        switch num {
        case 1, 4, 7, -1: nowLIndex = numL.firstIndex(of: num)!
            leftHandChanged = false
            return "L"
        case 3, 6, 9, -2: nowRIndex = numR.firstIndex(of: num)!
            rightHandChanged = false
            return "R"
        default:
            guard let numMIndex = numM.firstIndex(of: num) else {return ""}
            var LtoM = abs(nowLIndex-numMIndex)
            var RtoM = abs(nowRIndex-numMIndex)
            
            if leftHandChanged {
                RtoM += 1
            }
            if rightHandChanged {
                LtoM += 1
            }
            
            if LtoM == RtoM {
                if myhand == "L"{
                    leftHandChanged = true
                    nowLIndex = numM.firstIndex(of: num)!
                }else {
                    rightHandChanged = true
                    nowRIndex = numM.firstIndex(of: num)!
                }
                return myhand
            }
            else if LtoM < RtoM {
                nowLIndex = numM.firstIndex(of: num)!
                leftHandChanged = true
                return "L"
            }
            else {
                nowRIndex = numM.firstIndex(of: num)!
                rightHandChanged = true
                return "R"
            }
        }
    }

    return numbers.map{numIndex(num: $0)}.joined()
}

//print(solution([1, 2, 6, 0, 5], "right")) //LLRRL
