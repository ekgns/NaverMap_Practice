//
//  CenterViewModel.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation
import RxSwift
import Moya
import SwiftyJSON

class CenterViewModel {
    let disposeBag = DisposeBag()
    let provider = MoyaProvider<CenterService>()
    
    
    var CenterViewObs = BehaviorSubject<CenterListVO?>(value: nil)
    
    func requestCenter (page: Int, perPage: Int, completion: @escaping ()-> Void, failed: (()-> Void)? = nil) {
        provider.request(.readCenter(page: page, perPage: perPage)) { result in
            switch result {
            case .success(let response):
                do {
                    let res = try response.mapObject(CenterService<CenterListVO>.self)
                    
                }
            }
        }
    }
}
