//
//  CenterViewModel.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Alamofire

class CenterDataManager {
    func RequestCenterList(page: Int, perPager: Int, delegate: ViewController) {
        let url = "\(Constant.BASE_URL)/15077586/v1/centers?" + "&page=\(page)" + "&perpage=\(perPager)"
        let headers: HTTPHeaders = [
            "Authorization": CenterKey.Authorization, "Accept": "application/json"
        ]
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: CenterResponse.self) { response in
                switch response.result {
                case .success(let response):
                    delegate.getCenterList(result: response)
                
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failgetCenterList(message: "실패했다")
                }
                
            }
    }
}
