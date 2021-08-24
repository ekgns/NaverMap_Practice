//
//  Response.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Foundation
import ObjectMapper

struct CenterVO: Mappable {
    var currentCount: Int?
    var data: [CenterModel]?
    var matchCount: Int?
    var page: Int?
    var perPage: Int?
    var totalCount: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        currentCount <- map["currentCount"]
        data         <- map["data"]
        matchCount   <- map["matchCount"]
        page         <- map["page"]
        perPage      <- map["perPage"]
        totalCount   <- map["totalCount"]
    }
}



struct CenterModel: Mappable {
    var address: String?
    var centerName: String?
    var lat: String?
    var lng: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        address    <- map["address"]
        centerName <- map["centerName"]
        lat        <- map["lat"]
        lng        <- map["lng"]
    }
}

/*
 address": "충청남도 천안시 동남구 천안대로 357",
 "centerName": "코로나19 중부권역 예방접종센터",
 "centerType": "중앙/권역",
 "createdAt": "2021-03-03 07:00:52",
 "facilityName": "천안시 실내배드민턴장 1층",
 "id": 2,
 "lat": "36.779887",
 "lng": "127.164717",
 "org": "순천향대 천안병원",
 "phoneNumber": "",
 "sido": "충청남도",
 "sigungu": "천안시 동남구",
 "updatedAt": "2021-07-16 04:55:08",
 "zipCode": "31212"
 */
