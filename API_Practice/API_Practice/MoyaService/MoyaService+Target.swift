//
//  MoyaService+Target.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Moya
import ObjectMapper

// 타켓타입으로 API 사용으로 네트워킹 메서드의 상세기능을 설정한다
extension MoyaService: TargetType {
    // API 기본 URL
    var baseURL: URL { return URL(string: "https://api.odcloud.kr/api/15077586/v1/centers?")!}
    
    // 기능별 추가 되는 URL
    var path: String {
        switch self {
        case .getCenterList(let page, let perPage): return ""
        }
    }
    
    // REST API Type 설정 (.get, .post, ...)
    var method: Moya.Method {
        switch self {
        case .getCenterList: return .get
        }
    }
    
    // API가 해야할 일
    var task: Task {
        switch self {
        case .getCenterList: return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Contetnt-type": "application/json",  "Authorization": CenterKey.Authorization]
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

}
