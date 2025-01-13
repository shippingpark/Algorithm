//
//  Examples.swift
//  
//
//  Created by 박혜운 on 1/7/25.
//

import Foundation

public func example(of description: String, action: () -> ()) {
  print("---Example of \(description)---")
  action()
  print()
}
