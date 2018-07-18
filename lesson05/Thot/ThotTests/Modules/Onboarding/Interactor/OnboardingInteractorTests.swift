//
//  OnboardingInteractorTests.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import XCTest
import Nimble

@testable import Thot

class OnboardingInteractorTests: XCTestCase {

    private var interactor: OnboardingInteractor!
    private var defaultsManager: UserDefaultsManagerMock!

    override func setUp() {
        super.setUp()

        defaultsManager = UserDefaultsManagerMock()
        interactor = OnboardingInteractor(defaultsManager: defaultsManager)
    }

    func testUpdateVisibilityFlag() {
        interactor.updateOnboardingDidShow()

        expect(self.defaultsManager.isOnboardingDidShow).to(beTrue())
    }

}
