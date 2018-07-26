//
//  APIRequestAdapter.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

final class APIRequestAdapter: RequestAdapter {

    private enum Constants {
        static let authorizationHeader = "Authorization"
    }

    private let credentialsManager: CredentialsManager

    init(credentialsManager: CredentialsManager = UserCredentialsManager()) {
        self.credentialsManager = credentialsManager
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest

        if let jwtToken = credentialsManager.jwtAccessToken {
            request.setValue(jwtToken, forHTTPHeaderField: Constants.authorizationHeader)
        }

        return request
    }

}
