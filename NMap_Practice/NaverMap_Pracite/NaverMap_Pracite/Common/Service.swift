//
//  Service.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

enum Service {
    case centerList(vo: CenterListVO)
}
