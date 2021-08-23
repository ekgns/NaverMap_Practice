//
//  CenterService+Helper.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/22.
//

import Foundation
import Moya
import ObjectMapper

extension CenterService {
    enum StatusCode: String, CustomStringConvertible {
        case success = "200"
        case auError = "401"
        case apiError = "500"
        
        var debugDescription: String {
            switch self {
            case .success: return "success"
            case .auError: return "인증 실패"
            case .apiError: return "api 오류"
            }
        }
        
        var description: String {
            switch self {
            case .success: return ""
            case .apiError: return "api 가 안됨"
            default: return "서버가 불안정합니다"
            }
        }
    }
    
    static func checkResponse<T: Mappable> (_ res: CenterResponse<T>,
                                            _ filterSuccess: [StatusCode] = [.success],
                                            onOk:(()->Void)? = nil ) -> Bool {
        
        guard let status = res.status else {
            print("api errer 상태")
            return false
        }
        
        let r = StatusCode(rawValue: status)
        for b in filterSuccess {
            if r == b {
                return true
            }
        }
        
        
        if r == StatusCode.apiError {
          print("api 안되서 못부름 ")
            return false
        }
        
        return false
    }
    
    static func checkResponse<T: Mappable> (_ res: CenterArrayResponse<T>,
                                            _ filterSuccess: [StatusCode] = [.success],
                                            onOk:(()->Void)? = nil) -> Bool {
        
        guard let status = res.status else {
          print("")
        }
        
        let r = StatusCode(rawValue: status)
        for b in filterSuccess {
            if r == b {
                return true
            }
        }
        
        
        if r == StatusCode.auError {
            print("인증 에러 나서 못부름")
            return false
        }
        
        guard let _ = res.body else {
          
            return false
        }
    }
}
