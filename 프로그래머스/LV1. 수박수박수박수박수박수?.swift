

//  LV1. 수박수박수박수박수박수?

import Foundation

// MARK: - joined()


func solution(_ n:Int) -> String {
    return Array(1...n).map{$0 % 2 == 1 ? "수" : "박"}.joined()
}
