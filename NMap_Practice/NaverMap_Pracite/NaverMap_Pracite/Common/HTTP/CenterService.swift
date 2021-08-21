//
//  CenterService.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/20.
//

import Foundation
import Moya

// 제공하는 기능 열거형으로 만든다
enum CenterService {
    case readCenter(perPage: Int?) // 코로나 검사 예방접종센터 조회 api라 read기능밖에 없음
}

