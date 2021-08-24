//
//  MoyaService+Helper.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Moya

extension MoyaService {
    enum StatusCode: String, CustomStringConvertible {
        
        
        case success = "200"
        case centerFailed = "201"
        case noContents = "204"
        case resetContents = "205"
        case badRequest = "400"
        case unauthorized = "401"
        case forbidden = "403"
        case notFound = "404"
        case methodNotAllowed = "405"
        case conflicked = "409"
        case gone = "410"
        case locked = "423"
        case internalServerError = "500"
        
        var debugDescription: String {
            switch self {
            case .success:              return "success"
            case .centerFailed:         return "타조 자체 앱 에러"
            case .noContents:           return "데이터 없음"
            case .resetContents:        return "컨텐츠 재설정"
            case .badRequest:           return "request 형식 오류"
            case .unauthorized:         return "인증 실패"
            case .forbidden:            return "권한 없음"
            case .notFound:             return "요청 URL 없음"
            case .methodNotAllowed:     return "제한된 메서드 요청"
            case .conflicked:           return "리소스 충돌"
            case .gone:                 return "삭제된 API"
            case .locked:               return "토큰 만료"
            case .internalServerError:  return "내부 서버 오류"
            }
        }
        
        var description: String {
            switch self {
            case .success: return ""
            case .centerFailed: return "타조 서비스 에러"
            default: return "서버가 불안정합니다.\n빠른 시일내에 복구할게요!"
            }
        }
    }
}
