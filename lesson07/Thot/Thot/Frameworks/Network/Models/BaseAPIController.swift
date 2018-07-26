//
//  BaseAPIController.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

final class BaseAPIController: APIControllerProtocol {

    let manager: SessionManager

    init() {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        let manager = Alamofire.SessionManager(configuration: configuration)
        self.manager = manager
    }

    var baseURL: String {
        return String()
    }


}
