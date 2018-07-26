//
//  OnboardingRouter.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OnboardingRouter: OnboardingRouterProtocol, Storyboarded {
    
    static let storyboardName = "Onboarding"
    
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController {
        let view: OnboardingViewController = storyboard.instantiateViewController()
        let presenter = OnboardingPresenter()
        let router = OnboardingRouter()
        let interactor = OnboardingInteractor()
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

    func presentLoginScreen() {
        let loginController = LoginRouter.assembleModule()
        viewController.navigationController?.pushViewController(loginController, animated: true)
    }

}
