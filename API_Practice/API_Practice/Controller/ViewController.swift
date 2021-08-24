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

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let disposeBag = DisposeBag()
    
    var centers: [Center] = []
    let viewModel = CenterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getCenterList()
        
    }
    
    //    func setupRx() {
    //        searchBar
    //            .rx.text // RxCocoadml Observable 속성
    //            .orEmpty // 비어있지않다
    //            .delay(0.5, scheduler: MainScheduler.instance)
    //            .distinctUntilChanged() // 새로운 값이 이전의 값과 같은지 확인
    //            .filter{ !$0.isEmpty } // 정말 새로운 값이라면, 비어있지 않은 쿼리를 위해 필터링
    //            .subscribe(onNext: { [unowned self] query in // 모든 새로운 값에 대한 알림을 받을 수 있다
    //                self.showCities = self.allCities.filter{$0.hasPrefix(query)} // 도시를 찾기 위한 "API 요청"
    //                self.tableView.reloadData()
    //            })
    //            .disposed(by: disposeBag) // 구독해제
    //        }
    
    func getCenterList() {
        viewModel.requestCenterList(page: 1, perPage: 284) { data in
            self.centers = data.data
            self.tableView.reloadData()
        } failure: { error in
            let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

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

class Cell: UITableViewCell {
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
    
}
