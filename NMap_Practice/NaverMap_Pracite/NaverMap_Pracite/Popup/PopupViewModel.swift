//
//  PopupViewModel.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/27.
//

import Foundation
import UIKit

struct PopupViewModel {
    enum PopupType {
        case Info, Warning
    }
    
    enum PopupButtons {
        case one, two, none
    }
    
    var title: String?
    var desc: String?
    var okTitle: String?
    var onOK: (()->Void)?
    var onCancel: (()->Void)?
    var type: PopupType = .Info
    var button: PopupButtons = .one
}
