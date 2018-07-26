//
//  OnboardingInteractor.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

final class OnboardingInteractor: OnboardingInteractorProtocol {

    private enum Constants {
        static let onboardingFlag = "onboardingFlag"
    }

    private let defaultsManager: DefaultsManager

    init(defaultsManager: DefaultsManager = UserDefaultsManager()) {
        self.defaultsManager = defaultsManager
    }

    func updateOnboardingDidShow() {
        defaultsManager.isOnboardingDidShow = true
    }

}
