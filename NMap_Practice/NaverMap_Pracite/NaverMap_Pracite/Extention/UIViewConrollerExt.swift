//
//  UIViewConrollerExt.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/29.
//

import Foundation
import UIKit


extension UIViewController {
    func statusBarColor(color:UIColor ){
        let statusBarColor = color
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = statusBarColor
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = statusBarColor
        }
    }
    
    class func instantiateViewController(storyboard:String, viewController:String) -> UIViewController{
        let std : UIStoryboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        let vc : UIViewController = std.instantiateViewController(withIdentifier: viewController)
        return vc
    }
}

protocol Storyboarded {
    static func instantiate(storyboard: BaseViewController.Storyboard) -> Self
}

extension Storyboarded where Self: BasePopupViewController {
    static func instantiate(storyboard: BaseViewController.Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: self.stringName) as! Self
    }
}
