//
//  MoyaService.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Foundation
import Moya
import ObjectMapper


enum MoyaService {
    case getCenterList(page: Int, perPage: Int)
}
