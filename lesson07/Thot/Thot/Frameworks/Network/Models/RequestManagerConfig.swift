//
//  RequestManagerConfig.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

final class RequestManagerConfig {

    let apiController: APIControllerProtocol
    let errorParser: ErrorParser?
    let logLevel: NetworkDebugManager.LogLevel

    init(apiController: APIControllerProtocol = BaseAPIController(),
         errorParser: ErrorParser? = nil,
         logLevel: NetworkDebugManager.LogLevel = .all) {
        self.apiController = apiController
        self.errorParser = errorParser
        self.logLevel = logLevel
    }

}
