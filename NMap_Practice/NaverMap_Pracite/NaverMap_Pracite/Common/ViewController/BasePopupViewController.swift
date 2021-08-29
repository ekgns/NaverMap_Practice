//
//  BasePopupViewController.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/29.
//

import UIKit

class BasePopupViewController: UIViewController {

    
    var onOk:(()->Void)?
    var onCancel:(()->Void)?
    var param:[String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
}
