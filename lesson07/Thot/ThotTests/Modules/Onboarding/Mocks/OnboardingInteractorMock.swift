//
//  OnboardingInteractorMock.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

@testable import Thot

final class OnboardingInteractorMock: OnboardingInteractorProtocol {

    var isOnboardingFlagUpdated = false

    func updateOnboardingDidShow() {
        isOnboardingFlagUpdated = true
    }

}
