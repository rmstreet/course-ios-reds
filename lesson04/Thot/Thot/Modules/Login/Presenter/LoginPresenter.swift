//
//  LoginPresenter.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {

    var interactor: LoginInteractorProtocol!
    weak var view: LoginViewProtocol!
    var router: LoginRouterProtocol!

    func performSignIn() {
        interactor.performSignIn()
    }

}

// MARK: - LoginInteractorOutput
extension LoginPresenter: LoginInteractorOutput {

    func onLoginSuccess() {
        router.presentMainScreen()
    }

    func onLoginFailure() {
        view.presentError(message: "Falha no login")
    }

}
