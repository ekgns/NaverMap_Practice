//
//  CenterViewModel.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation
import Moya
import RxSwift
import RxOptional
import RxCocoa



class CenterViewModel {
    let disposBag = DisposeBag()
    let provider = MoyaProvider<CenterService>()
    
    let centerObs = BehaviorSubject<CenterListVO?>(value:nil)

    func requestMainView (page: Int,
                          perPage: Int,
                          completion: @escaping ()->Void
                          , failed:(()->Void)? = nil ) {
        provider.request(.getCenterList(page: page, perPage: perPage)) { (result) in
            switch result {
            case .success(let response):
                
                CenterService.showFailure(error)
                failed?()
                
            case let .failure(error):
                CenterService.showFailure(error)
                failed?()
            }
        }
    }

    
//    func requestCenterList(page: Int, perPage: Int, completion: @escaping (CenterListVO)-> (), failure: @escaping (String)-> ()) {
//        provider.request(.getCenterList(page: page, perPage: perPage)) { result in
//            switch result {
//            case  .success(let response):
//                do {
//
//                    print("\(result) ,/////// \(response)")
//                    let centerList = try JSONDecoder().decode(CenterListVO.self, from: response.data)
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
