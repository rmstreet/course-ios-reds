//
//  UserDefaultsManager.swift
//  Thot
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

final class UserDefaultsManager: DefaultsManager {

    private enum Constants {
        static let onboardingFlag = "onboardingFlag"
    }

    private let userDefaults: UserDefaultsProtocol

    init(userDefaults: UserDefaultsProtocol = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    var isOnboardingDidShow: Bool {
        get {
            return userDefaults.bool(forKey: Constants.onboardingFlag)
        }
        set {
            userDefaults.set(true, forKey: Constants.onboardingFlag)
            userDefaults.synchronize()
        }
    }

}
