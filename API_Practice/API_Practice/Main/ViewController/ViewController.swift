//
//  ViewController.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import UIKit
import Moya
import Moya_ObjectMapper
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var
    
    let disposeBag = DisposeBag()
    
    var centers: [Center] = []
    let viewModel = CenterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        
//        getCenterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.requestCenterList(page: 1, perPage: 284, completion: {
            self.tableView.reloadData()
        })
    }
    
//    func getCenterList() {
//        viewModel.requestCenterList
//        viewModel.requestCenterList(page: 1, perPage: 284) { data in
//            self.centers = data.data
//            self.tableView.reloadData()
//        } failure: { error in
//            let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
//            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
}

