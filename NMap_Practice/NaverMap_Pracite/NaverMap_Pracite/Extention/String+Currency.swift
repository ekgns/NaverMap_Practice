//
//  String+Currency.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/25.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}


