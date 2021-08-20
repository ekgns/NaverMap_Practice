//
//  CenterDefine.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation

struct Centerdefine {
    enum page: String, CustomStringConvertible {
        case page = "1"
        
        var description: String {
            switch self {
            case .page: return "페이지"
            }
        }
    }
    
    enum perPage: String, CustomStringConvertible {
        case perPage = "284"
        
        var description: String {
            switch self {
            case .perPage: return "페이지 별 출력 수"
            }
        }
    }
}
