

//Lv1. 부족한 금액 계산하기


import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let answer:Int64 = Int64(count * (price + count * price) / 2)
    return money >= answer ? 0 : answer - Int64(money)
}

