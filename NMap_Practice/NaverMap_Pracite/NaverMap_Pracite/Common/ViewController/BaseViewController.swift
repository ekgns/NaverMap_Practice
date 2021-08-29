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
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func addNavigationRightButton(title: String, buttonColor: UIColor = .veryLightPink, completion: Selector) {
        let button = UIBarButtonItem(title: title, style: .plain, target: self, action: completion)
        button.tintColor = buttonColor
        navigationItem.rightBarButtonItem = button
    }
    
    func addNavigationFlashButton(isLeft:Bool = false, completion: Selector) {
        let button = UIBarButtonItem(image: UIImage(named: "flashOff"), style: .plain, target: self, action: completion)
        button.tag = 20200921
        button.tintColor = UIColor.black
        if isLeft {
            navigationItem.leftBarButtonItem = button
        } else {
            navigationItem.rightBarButtonItem = button
        }
    }
    
    func addNavigationCloseButton(isLeft:Bool = true, completion:Selector){
        let button = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: completion)
        button.tintColor = UIColor.black
        if isLeft {
            navigationItem.leftBarButtonItem = button
        } else {
            navigationItem.rightBarButtonItem = button
        }
    }
    
    func push(storyBoard:Storyboard, vcName:String, param:[String:Any]? = nil, animated:Bool = false){
        let vc = UIViewController.instantiateViewController(storyboard: storyBoard.rawValue, viewController: vcName)
        
        if(vc is BaseViewController) {
            let vcBase = vc as? BaseViewController
            vcBase?.param = param
        }
        
    }
}
