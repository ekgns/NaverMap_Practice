//
//  CenterVO.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//


import Foundation
import ObjectMapper
/*
 "data": [
        {
            "address": "서울특별시 중구 을지로 39길 29",
            "centerName": "코로나19 중앙 예방접종센터",
            "centerType": "중앙/권역",
            "createdAt": "2021-03-03 07:00:52",
            "facilityName": "국립중앙의료원 D동",
            "id": 1,
            "lat": "37.567817",
            "lng": "127.004501",
            "org": "국립중앙의료원",
            "phoneNumber": "02-2260-7114",
            "sido": "서울특별시",
            "sigungu": "중구",
            "updatedAt": "2021-07-16 04:55:08",
            "zipCode": "04562"
        },
 */

struct CenterListVO: Mappable {
    var daress: String?
    var centerName: String?
    var centerType: String?
    var createdAt: String?
    var facilityName: String?
    var id: Int?
    var lat: String?
    var lng: String?
    var org: String?
    var phoneNumber: String?
    var sido: String?
    var sigungu: String?
    var updatedAt: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
       daress <- map["daress"]
       centerName <- map["centerName"]
       centerType <- map["centerType"]
       createdAt <- map["createdAt"]
       facilityName <- map["facilityName"]
       id <- map["id"]
       lat <- map["lat"]
       lng <- map["lng"]
       org <- map["org"]
       phoneNumber <- map["phoneNumber"]
       sido <- map["sido"]
       sigungu <- map["sigungu"]
       updatedAt <- map["updatedAt"]
    }
}
