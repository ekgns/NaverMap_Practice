//
//  CenterService.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

// 제공하는 기능 열거형으로 만든다
enum CenterService {
    
    case getCenterList(page: Int, perPage: Int)
}

