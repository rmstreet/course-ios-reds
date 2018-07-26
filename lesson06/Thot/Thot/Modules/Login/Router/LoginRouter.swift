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
        let remoteDataManager = LoginRemoteDataManager()
        let localDataManager = LoginLocalDataManager()
        let repository = LoginRepository(remoteDataManager: remoteDataManager, localDataManager: localDataManager)
        let interactor = LoginInteractor(repository: repository)

        view.presenter = presenter

        router.viewController = view

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }

    func presentMainScreen() {
        let tabContainerController = TabContainerRouter.assembleModule()
        viewController.navigationController?.pushViewController(tabContainerController, animated: true)
    }

    func presentOfflineScreen(tryAgainBlock: @escaping () -> Void) {
        let offlineController = OfflineRouter.assembleModule(isTryAgainOnly: false, tryAgainBlock: nil)
        viewController.present(offlineController, animated: true, completion: nil)
    }

}
