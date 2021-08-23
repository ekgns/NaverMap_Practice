//
//  ViewController.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var centers: [CenterModel] = []
    let viewModel = CenterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        viewModel.RequestCenterList(page: 1, perPager: 2, delegate: self)
        
    }
    
    func getCenterList(result: CenterResponse) {
//        centers = result.data
        tableView.reloadData()
    }
    
    func failgetCenterList(message: String) {
        print("viewModel: \(message)")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else { return UITableViewCell()}
        let center = centers[indexPath.row]
        cell.centerName.text = "\(center.centerName)"
        cell.adress.text = "\(center.address)"
        cell.lat.text = "\(center.lat)"
        cell.lng.text = "\(center.lng)"
        return cell
    }
    
    
}

class Cell: UITableViewCell {
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
    
}
