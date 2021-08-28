//
//  PopUp.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/27.
//

import Foundation
import UIKit

class Popup {
    static let shared = Popup()
    
    private init() {}
    
    func show(type: PopupViewModel.PopupType
              , buttonCount: PopupViewModel.PopupButtons
              , title: String?
              , desc: String?
              , okTitle: String? = "확인"
              , onOk: (() -> Void)? = nil
              , onCancel: (() -> Void)? = nil  ) {
        guard let vc = UIViewController.instantViewController(storybard: Base)
    }
