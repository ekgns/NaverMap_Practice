//
//  CenterViewModel.swift
//  NaverMap_Pracite
//
//  Created by 다훈김 on 2021/08/19.
//

import Foundation
import Moya
import RxSwift
import RxOptional

class CenterViewModel {
    var provider: MoyaProvider<Service> {
        return MoyaProvider<Service>(endpointClosure: NetworkActivityPlugin(networkActivityClosure: {
            change, target in
            let aa = "\(change), \(target)"
        }))
    }
}
