//
//  Service+TargetType.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

extension Service: TargetType {
    var baseURL: URL {
       return URL(string: "api.odcloud.kr/api")!
    }
    
    var path: String {
        switch self {
        case .centerList(vo: _): return "/15077586/v1/centers"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        // GET
        case .centerList(vo: _):
            return .get
        }
    }
    
    var sampleData: Data {
        return "sampleData is not sopported".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .centerList(let vo):
            return .requestParameters(parameters: vo.toJSON(), encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .centerList(vo: _):
            return ["Content-type": "application/json;charset=UTF-8"]
            
        default:
            return ["Content-type": "application/json;charset=UTF-8"]
        }
    }
    
    
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
