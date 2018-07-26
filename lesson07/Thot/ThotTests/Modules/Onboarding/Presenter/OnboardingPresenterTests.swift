//
//  OnboardingPresenterTests.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import XCTest
import Nimble

@testable import Thot

class OnboardingPresenterTests: XCTestCase {

    private var presenter: OnboardingPresenter!
    private var router: OnboardingRouterMock!
    private var interactor: OnboardingInteractorMock!

    override func setUp() {
        super.setUp()

        router = OnboardingRouterMock()
        interactor = OnboardingInteractorMock()

        presenter = OnboardingPresenter()
        presenter.router = router
        presenter.interactor = interactor
    }

    func testOpenLoginScreenWhenFinish() {
        presenter.finishOnboarding()

        expect(self.router.isLoginScreenPresented).to(beTrue())
    }

    func testUpdateOnboardingFlagOnFinish() {
        presenter.finishOnboarding()

        expect(self.interactor.isOnboardingFlagUpdated).to(beTrue())
    }

}
