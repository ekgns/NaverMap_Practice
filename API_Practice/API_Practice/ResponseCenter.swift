//
//  CenterResponse.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//


import Foundation
import ObjectMapper

struct ResponseCenter<T:Mappable>: Mappable {
    var status: String?
    var msg: String?
    var body: T?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        body <- map["body"]
    }
}

struct CenterArrayResponse<T:Mappable>: Mappable {
    var status: String?
    var msg: String?
    var body: T?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        msg <- map["msg"]
        body <- map["body"]
    }
}


struct NullBody: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {}
}

