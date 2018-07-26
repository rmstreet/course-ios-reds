//
//  RequestManagerProtocol.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestManagerProtocol {

    static var config: RequestManagerConfig { get }

    func request(endpoint: Endpoint, data: Encodable?, encoding: ParameterEncoding?, headers: HTTPHeaders?) -> DataRequest

}

extension RequestManagerProtocol {

    func request(endpoint: Endpoint, data: Encodable? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil) -> DataRequest {
        return request(endpoint: endpoint, data: data, encoding: encoding, headers: headers)
    }

}
