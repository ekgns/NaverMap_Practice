//
//  MoyaService.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Foundation
import Moya

enum MoyaService {
    // 네트워킹 할 메서드를 만든다
//    static private let Authorization = "Infuser N28F7A1MFhXnb5cIYDYz3XH4Rea8ZV3kT9aVpy8dTTXb3huQ9WYBvOzqa11VnXaPrW3OMqqhaOv3AhrFl06HMA=="
    case getCenterList(page: Int, perPage: Int)
}

