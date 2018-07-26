//
//  UserCredentialsManager.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import KeychainAccess

final class UserCredentialsManager: CredentialsManager {

    private enum Constants {
        private static let bundleIdentifier = Bundle.main.bundleIdentifier ?? String()
        static let credentialsService = "\(Constants.bundleIdentifier).credentials"
        static let jwtAccessToken = "jwtAccessToken"
    }

    private let keychain = Keychain(service: Constants.credentialsService)

    var jwtAccessToken: String? {
        get {
            return keychain[Constants.jwtAccessToken]
        }
        set {
            if let token = newValue {
                keychain[Constants.jwtAccessToken] = token
            } else {
                removeCredentials(key: Constants.jwtAccessToken)
            }
        }
    }

    private func removeCredentials(key: String) {
        do {
            try keychain.remove(key)
        } catch {
            debugPrint("Fail to remover JWT Token")
        }
    }

}
