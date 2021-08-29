//
//  NSObject.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/29.
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
