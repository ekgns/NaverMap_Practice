//
//  BaseViewController.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/28.
//

import Foundation
import ObjectMapper

class BaseViewController: UIViewController {
    enum Storyboard: String {
        case Intro = "Intro"
        , Sign = "Sign"
        , Home = "Home"
        , Report = "Report"
        , Payment = "Payment"
        , Usign = "Usign"
        , SideMenu = "SideMenu"
        , Popup = "Popup"
    }
    
    var hideNavigationBar:Bool {
        set {
            navigationController?.navigationBar.isHidden = newValue
        }
        get {
            return (navigationController?.navigationBar.isHidden)!
        }
    }
    
    var hideNavigationBackButton:Bool {
        set {
            navigationItem.setHidesBackButton(newValue, animated: false)
        }
        get {
            navigationItem.hidesBackButton
        }
    }
    
    var param: [String:Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func resetUI() {
//        resetFlashButton()
    }
    
    func setupNavigationBar() {
        hideNavigationBar = false
        let textArrtibutes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textArrtibutes
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        UIBarButtonItem.appearance()
            .setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -10.ratioConstant), for: .default)
    }
}
