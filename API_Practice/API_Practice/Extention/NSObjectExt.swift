//
//  NSObjectExt.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/09/01.
//

import Foundation

extension NSObject {
    static var stringName:String {
        return "\(self)"
    }
    func delay(interval: TimeInterval, closure: @escaping () -> Void) {
         DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
              closure()
         }
    }
    
 
}


