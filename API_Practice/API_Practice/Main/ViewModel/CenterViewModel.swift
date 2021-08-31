//
//  CenterViewModel.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Moya
import RxCocoa
import RxSwift
import Moya_ObjectMapper
import RxOptional
import Foundation

//class CenterDataManager {
//    func RequestCenterList(page: Int, perPager: Int, delegate: ViewController) {
//        let url = "\(Constant.BASE_URL)/15077586/v1/centers?" + "&page=\(page)" + "&perpage=\(perPager)"
//        let headers: HTTPHeaders = [
//            "Authorization": CenterKey.Authorization, "Accept": "application/json"
//        ]
//        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
//            .validate()
//            .responseDecodable(of: CenterResponse.self) { response in
//                switch response.result {
//                case .success(let response):
//                    delegate.getCenterList(result: response)
//
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    delegate.failgetCenterList(message: "실패했다")
//                }
//
//            }
//    }
//}

//class CenterViewModel {
//    fileprivate let provider = MoyaProvider<MoyaService>()
//    func requestCenterList(page: Int
//                           , perPage: Int
//                           , completion: @escaping (CenterModel)-> Void
//                           , failure: @escaping (String)-> ()) {
//        provider.request(.getCenterList(page: page, perPage: perPage)) { result in
//            switch result {
//            case let .success(reponse):
//                do {
//                    let centerList = try JSONDecoder().decode(CenterModel.self, from: reponse.data)
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
//}

class CenterViewModel {
    let provider = MoyaProvider<MoyaService>()
    
    func requestCenterList(page: Int
                           , perPage: Int
                           , completion: @escaping (CenterModel)-> Void
                           , failed:(()->Void)? = nil) {
        provider.request(.getCenterList(page: page, perPage: perPage)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let centerList = try response.mapObject(MoyaResponse<CenterModel>.self)
//                    if MoyaService
//                    completion(centerList)
                } catch {
//                    MoyaService.
                    failed?()
                }
            case let .failure(error):
                
                failed?()
            }
        }
    }
}
