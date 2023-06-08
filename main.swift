//
//  main.swift
//  Created by 박혜운 on 2023/02/22.
//

import Foundation

var a = "12"
var b = a.index(a.endIndex, offsetBy: -3, limitedBy: a.startIndex)


func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    var string = my_string
    var firstIndex = my_string.index(my_string.startIndex, offsetBy: s)
    var lastIndex = my_string.index(firstIndex, offsetBy: overwrite_string.count - 1)
    string.replaceSubrange((firstIndex...lastIndex) , with: overwrite_string)
    
    return string
}

