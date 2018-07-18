//
//  OnboardingPresenter.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OnboardingPresenter: OnboardingPresenterProtocol {
    
    weak var view: OnboardingViewProtocol!
    var router: OnboardingRouterProtocol!
    var interactor: OnboardingInteractorProtocol!

    func finishOnboarding() {
        interactor.updateOnboardingDidShow()
        router.presentLoginScreen()
    }

}
