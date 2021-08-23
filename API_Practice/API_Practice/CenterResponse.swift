//
//  Response.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/08/23.
//

import Foundation

struct Response: Decodable {
    var page: Int
    var perPage: Int
    var totalCount: Int
    var CureentCount: Int
    var data: [Data]
}


struct Data {
    var id: Int
    var centerName: String
    var sigungu: String
    var facilityName : String
    var zipCode : String
    var address: String
    var lat: String
    var lng: String
    var createdAt: String
    var updatedAt: String
    var centerType: String
    var org: String
    var phoneNumber: String
}
