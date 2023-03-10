//
//  LV2. 점프와 순간 이동 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/03.
//

import Foundation

// MARK: - 2진수에서의 1의 갯수가 답인 이유

//- 모든 수(n)는 2진수로 표기 가능하다.
//- 텔레포트는 제곱 형태로 진행된다.
//- 텔레포트 횟수는 2의 지수형태이다.
//- 현재 위치 * 2 ^(텔레포트 수) 가 이동 위치이다.
//- 한 칸 점프하고 텔레포트하면 그것도 2로 묶이는 일이 된다. (2^텔레포트 수 가 곱해지니까, 결국 2의 배수가 되는 일)
//- 모든 수는 2진수로 표기 가능하므로, 묶이지 않는 수가 있다면 그건 반드시1이다. (점프를 한 번 이상 할 필요 없는 이유)
//한 점프한 뒤에 텔레포트, 만약 안될 것 같으면 다시 한 칸 점프한 뒤에 현재 위치로 부터 또 텔레포트,,, 무한 반복하면 딱 맞아 떨어지거나 1만 남거나!!!
//그게 곧 2진수에서의 1의 갯수!!!!!!!!!!!!!!!!!!

//이게 가장 효율적인 이유는 반드시 곱하기 2 단위로 움직이는 게 (텔레포트로만 최대한 많이 움직이는 게) 배터리를 닳지 않게 하기 때문!!


func solution(_ n:Int) -> Int {
    var num = 0
    var i = n
    while i > 0 {
        num += (i % 2) //나누어 떨어지지 않으니 한 칸 점프해야 한다는 뜻
        i = (i % 2 == 0) ? i/2 : i-1 //나누어 떨어지면 i는 반토막(어떤 수를 기준으로 한 번 텔레포트 됐다는 뜻), 나누어 떨어지지 않으면 텔레포트가 아닌 한 칸 이동했다는 뜻
    }
    
    return num
}
