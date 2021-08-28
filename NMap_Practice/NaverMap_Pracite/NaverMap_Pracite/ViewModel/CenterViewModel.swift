//
//  CenterViewModel.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation
import RxSwift
import Moya
import RxOptional
import NMapsMap
import RxDataSources


class CenterViewModel {
    fileprivate let provider = MoyaProvider<CenterService>()
    var disposBag = DisposeBag()
    
    
    var centerObs = BehaviorSubject<CenterListVO?>(value:nil)
    func requestCenterList(page: Int, perPage: Int, completion: @escaping (CenterListVO)-> (), failure: @escaping (String)-> ()) {
        provider.request(.getCenterList(page: page, perPage: perPage)) { result in
            switch result {
            case  .success(let response):
                do {
                    let centerList = try response.mapObject(CenterResponse<CenterListVO>.self)
                    if CenterService<>
                    completion(centerList)
                } catch let error {
                    print("여기로 들어옴\(result)")
                    failure(error.localizedDescription)
                }
            case let .failure(error):

                failure(error.localizedDescription)
            }
        }
    }
    
    
//    func requestCenterList(page: Int, perPage: Int, completion: @escaping (CenterListVO)-> (), failure: @escaping (String)-> ()) {
//        provider.request(.getCenterList(page: page, perPage: perPage)) { result in
//            switch result {
//            case  .success(reponse):
//                do {
//                    let centerList = try JSONDecoder().decode(CenterListVO.self, from: reponse.data)
//                    completion(centerList)
//                } catch let error {
//                    print("여기로 들어옴\(result)")
//                    failure(error.localizedDescription)
//                }
//            case let .failure(error):
//
//                failure(error.localizedDescription)
//            }
//        }
//    }
    
   
}
