//
//  UITableViewExt.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/09/01.
//

import Foundation
import UIKit

extension UITableView {
    func registerCustomTableViewCell(reuseIdentifier:String) {
        let nib = UINib.init(nibName: reuseIdentifier, bundle: Bundle.main)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
