//
//  NetworkDebugManager.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkDebugManager {

    enum LogLevel {
        case basic
        case all
    }

    static func log<T>(_ response: DataResponse<T>) {
        #if DEBUG

        log(message: "==> Network Request: \(String(describing: response.response))")
        log(message: "==> Network Result: \(response.result)")
        log(message: "==> Network Error: \(String(describing: response.result.error))")

        if RequestManager.config.logLevel == .all {
            log(message: "==> Network Headers: \(String(describing: response.request?.allHTTPHeaderFields))")

            let body = String(data: response.request?.httpBody ?? Data(), encoding: .utf8)
            log(message: "==> Network Body: \(String(describing: body))")

            let responseData = String(data: response.data ?? Data(), encoding: .utf8)
            log(message: "==> Network Response: \(String(describing: responseData))")
        }

        #endif
    }

    private static func log(message: String) {
        debugPrint(message.replacingOccurrences(of: "\\", with: ""))
    }

}
