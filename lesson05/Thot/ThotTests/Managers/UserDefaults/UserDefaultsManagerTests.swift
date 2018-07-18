//
//  UserDefaultsManagerTests.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import XCTest
import Nimble

@testable import Thot

class UserDefaultsManagerTests: XCTestCase {

    private var defaultManager: UserDefaultsManager!
    private var userDefaults: UserDefaultsMock!

    override func setUp() {
        super.setUp()

        userDefaults = UserDefaultsMock()
        defaultManager = UserDefaultsManager(userDefaults: userDefaults)
    }

    func testeUpdateOnboardingValue() {
        defaultManager.isOnboardingDidShow = true

        expect(self.userDefaults.booleanValue).to(beTrue())
        expect(self.userDefaults.isSynchronized).to(beTrue())
        expect(self.userDefaults.keyValue).to(equal("onboardingFlag"))
    }

    func testFetchOnboardingValue() {
        userDefaults.booleanValue = true

        let isOnboardingDidShow = defaultManager.isOnboardingDidShow

        expect(isOnboardingDidShow).to(beTrue())
    }

}
