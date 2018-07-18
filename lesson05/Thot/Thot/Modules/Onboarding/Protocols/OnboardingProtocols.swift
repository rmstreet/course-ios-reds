//
//  OnboardingProtocols.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interactor
protocol OnboardingInteractorProtocol: class {

    func updateOnboardingDidShow()
    
}

// MARK: - Presenter
protocol OnboardingPresenterProtocol: class {
    
    var view: OnboardingViewProtocol! { get set }
    var router: OnboardingRouterProtocol! { get set }
    var interactor: OnboardingInteractorProtocol! { get set }

    func finishOnboarding()
    
}

// MARK: - View
protocol OnboardingViewProtocol: class {
    
    var presenter: OnboardingPresenterProtocol! { get set }
    
}

// MARK: - Router
protocol OnboardingRouterProtocol: class {
    
    var viewController: UIViewController! { get set }

    func presentLoginScreen()

}


