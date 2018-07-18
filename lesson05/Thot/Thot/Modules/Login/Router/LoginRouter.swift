//
//  LoginRouter.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

final class LoginRouter: Storyboarded, LoginRouterProtocol {

    static var storyboardName = "Login"

    var viewController: UIViewController!

    static func assembleModule() -> UIViewController {
        let view: LoginViewController = storyboard.instantiateViewController()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()

        view.presenter = presenter

        router.viewController = view

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        return view
    }

    func presentMainScreen() {
        let mainController = LoginRouter.assembleModule()
        viewController.present(mainController, animated: true, completion: nil)
        viewController.navigationController?.pushViewController(mainController, animated: true)
    }

    func presentOfflineScreen(tryAgainBlock: @escaping () -> Void) {
        let offlineController = OfflineRouter.assembleModule(isTryAgainOnly: false, tryAgainBlock: nil)
        viewController.present(offlineController, animated: true, completion: nil)
    }

}
