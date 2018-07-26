//
//  Endpoint.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {

    private enum Constants {
        static let curlBracesRegexValidation = "\\{(.*?)\\}"
    }

    let method: HTTPMethod
    let api: ServiceApi
    let port: ServicePort?
    let version: ServiceVersion?
    let pathParameters: [String: String]
    let resource: String?
    let baseUrl: String?

    init(method: HTTPMethod = .get, api: ServiceApi, port: ServicePort? = nil, version: ServiceVersion? = nil, pathParameters: [String: String] = [:], resource: String? = nil, baseUrl: String? = nil) {
        self.method = method
        self.api = api
        self.port = port
        self.version = version
        self.pathParameters = pathParameters
        self.resource = resource
        self.baseUrl = baseUrl
    }

    func makeURL(baseUrl: String) -> URL {
        let url = self.baseUrl ?? baseUrl
        var urlString = "\(url)/\(api.api)"

        if let resource = resource {
            urlString.append("/\(resource)")
        }

        if let version = version {
            urlString = urlString.replacingOccurrences(of: "{\(version.placeHolder)}", with: version.value)
        }

        if let port = port {
            urlString = urlString.replacingOccurrences(of: "{\(port.placeHolder)}", with: port.value)
        }

        pathParameters.forEach { (placeHolder, value) in
            urlString = urlString.replacingOccurrences(of: "{\(placeHolder)}", with: value)
        }

        return validateAndCreateURL(urlString: urlString)
    }

    private func validateAndCreateURL(urlString: String) -> URL {
        let keys = urlString.matches(for: Constants.curlBracesRegexValidation, in: urlString)

        guard let url = URL(string: urlString),
            keys.isEmpty else {
                fatalError("Endpoint error: \(urlString) is not a valid URL, needs to replace keys: \(keys.joined(separator: " | "))")
        }

        return url
    }

}
