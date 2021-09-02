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
    
    
    var viewModel = CenterViewModel()
    var refresh = true
    
    var disposeBag = DisposeBag()
    
    var centers: [Center] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
//        getCenterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.requestCenterList(page: 1, perPage: 284, completion: {
            self.tableView.reloadData()
        })
        
        
    }
    
    func setupRx() {
        viewModel.centerViewObs.subscribe(onNext: { vo in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func bindTableView(){
        // 커스텀 한 재사용 셀 설정
        tableView.registerCustomTableViewCell(reuseIdentifier: CenterListTableViewCell.stringName)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.centerViewObs.bind(to: tableView.rx.items(cellIdentifier: CenterListTableViewCell.stringName)) {
            (index:Int, element:CenterListItemVO, cell:CenterListTableViewCell) in
            cell.setData(vo: element)
        }
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

