//
//  LoginPresenter.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

final class LoginPresenter: LoginPresenterProtocol {

    var interactor: LoginInteractorProtocol!
    weak var view: LoginViewProtocol!
    var router: LoginRouterProtocol!

    private let disposeBag = DisposeBag()

    func performSignIn() {
        interactor.authenticateObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onCompleted: { [weak self] in
                self?.router.presentMainScreen()
            }, onError: { [weak self] error in
                self?.onSignInError(error: error)
            })
            .disposed(by: disposeBag)
    }

    private func onSignInError(error: Error) {
        switch error {
        case URLError.notConnectedToInternet,
             URLError.timedOut:
            presentOfflineScreen()

        default:
            view.presentError(message: "Falha no login")
        }
    }

    private func presentOfflineScreen() {
        router.presentOfflineScreen { [weak self] in
            self?.performSignIn()
        }
    }

}
