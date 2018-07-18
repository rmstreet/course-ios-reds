//
//  OnboardingRouterMock.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

@testable import Thot

final class OnboardingRouterMock: OnboardingRouterProtocol {

    var viewController: UIViewController!
    var isLoginScreenPresented = false

    func presentLoginScreen() {
        isLoginScreenPresented = true
    }

}
