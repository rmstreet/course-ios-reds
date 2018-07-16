//
//  LoginProtocols.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Router
protocol LoginRouterProtocol: class {

    var viewController: UIViewController! { get set }

    func presentMainScreen()

}

// MARK: - Presenter
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorProtocol! { get set }
    var view: LoginViewProtocol! { get set }
    var router: LoginRouterProtocol! { get set }

    func performSignIn()

}

// MARK: - View
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol! { get set }

    func presentError(message: String)

}

// MARK: - Interactor
protocol LoginInteractorProtocol: class {

    var output: LoginInteractorOutput! { get set }

    func performSignIn()

}

protocol LoginInteractorOutput: class {

    func onLoginSuccess()
    func onLoginFailure()

}


