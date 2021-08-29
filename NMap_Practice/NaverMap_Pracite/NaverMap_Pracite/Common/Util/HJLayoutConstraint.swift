//
//  HJLayoutConstraint.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/29.
//

import Foundation
import UIKit

let STANDARD_IPHONE_WIDTH:CGFloat = 375
let SCREEN_WIDTH_RADIO = UIScreen.main.bounds.width / STANDARD_IPHONE_WIDTH

class HJLayoutConstraint: NSLayoutConstraint {
    override var constant: CGFloat {
        set (newValue) {
            super.constant = newValue
        }
        get {
            return super.constant.ratioConstant
        }
    }
}

extension Double {
    var ratioConstant: CGFloat { return CGFloat(self) * SCREEN_WIDTH_RADIO }
}

extension CGFloat {
    var ratioConstant: CGFloat { return self * SCREEN_WIDTH_RADIO }
}

extension Int {
    var ratioConstant: CGFloat { return CGFloat( self ) * SCREEN_WIDTH_RADIO }
}

