//
//  OfflineViewMock.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

@testable import Thot

final class OfflineViewMock: OfflineViewProtocol {

    var presenter: OfflinePresenterProtocol!
    var isButtonCloseVisible = true
    var isButtonTryAgainVisible = true

    func disableTryAgainButton() {
        isButtonTryAgainVisible = false
    }

    func disableCloseButton() {
        isButtonCloseVisible = false
    }

}
