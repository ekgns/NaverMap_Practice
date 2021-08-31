//
//  ViewController+Extention.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/24.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else { return UITableViewCell()}
        let center = centers[indexPath.row]
        print("\(center.centerName)")
        print("\(center.address)")
        print("\(center.lat)")
        print("\(center.lng)")
        cell.centerName.text = "\(center.centerName)"
        cell.adress.text = "\(center.address)"
        cell.lat.text = "\(center.lat)"
        cell.lng.text = "\(center.lng)"
        return cell
    }
}

