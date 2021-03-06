//
//  CenterResponse.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/25.
//

import Foundation
import ObjectMapper

struct CenterResponse<T: Mappable>: Mappable {
    var status: String?
    var msg: String?
    var body: T?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        msg <- map["map"]
        body <- map["body"]
    }
}

struct CenterArrayResponse<T: Mappable>: Mappable {
    var status: String?
    var msg: String?
    var body: T?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        msg <- map["map"]
        body <- map["body"]
    }
}

struct NullBody:Mappable{
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        
    }
}

