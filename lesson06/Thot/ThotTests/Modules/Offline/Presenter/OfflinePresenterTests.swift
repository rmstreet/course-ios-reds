//
//  OfflinePresenterTests.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import XCTest
import Nimble

@testable import Thot

class OfflinePresenterTests: XCTestCase {

    private var router: OfflineRouterMock!
    private var view: OfflineViewMock!

    override func setUp() {
        super.setUp()

        router = OfflineRouterMock()
        view = OfflineViewMock()
    }

    private func assemblePresenter(isTryAgainOnly: Bool, tryAgainBlock: (() -> Void)?) -> OfflinePresenter {
        let presenter = OfflinePresenter(isTryAgainOnly: isTryAgainOnly, tryAgainBlock: tryAgainBlock)
        presenter.router = router
        presenter.view = view

        return presenter
    }

    func testDisableCloseButton() {
        let presenter = assemblePresenter(isTryAgainOnly: true, tryAgainBlock: { })
        presenter.viewDidLoad()

        expect(self.view.isButtonCloseVisible).to(beFalse())
        expect(self.view.isButtonTryAgainVisible).to(beTrue())
    }

    func testDisableTryAgainButton() {
        let presenter = assemblePresenter(isTryAgainOnly: false, tryAgainBlock: nil)
        presenter.viewDidLoad()

        expect(self.view.isButtonCloseVisible).to(beTrue())
        expect(self.view.isButtonTryAgainVisible).to(beFalse())
    }

    func testEnableCloseAndTryAgainButtons() {
        let presenter = assemblePresenter(isTryAgainOnly: false, tryAgainBlock: { })
        presenter.viewDidLoad()

        expect(self.view.isButtonCloseVisible).to(beTrue())
        expect(self.view.isButtonTryAgainVisible).to(beTrue())
    }

    func testDismissScreenWhenTapClose() {
        let presenter = assemblePresenter(isTryAgainOnly: false, tryAgainBlock: nil)
        presenter.closeScreen()

        expect(self.router.isScreenClosed).to(beTrue())
    }

    func testDismissScreenAndCallTryAgainWhenTapTryAgain() {
        var isTryAgainBlockCalled = false
        let presenter = assemblePresenter(isTryAgainOnly: true, tryAgainBlock: {
            isTryAgainBlockCalled = true
        })
        presenter.tryAgain()

        expect(self.router.isScreenClosed).to(beTrue())
        expect(isTryAgainBlockCalled).to(beTrue())
    }

}
