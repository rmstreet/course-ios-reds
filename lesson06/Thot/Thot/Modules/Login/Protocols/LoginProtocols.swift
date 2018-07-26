//
//  LoginProtocols.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

// MARK: - Router
protocol LoginRouterProtocol: class {

    var viewController: UIViewController! { get set }

    func presentMainScreen()
    func presentOfflineScreen(tryAgainBlock: @escaping () -> Void)

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

    var authenticateObservable: Completable { get }

}

// MARK: - Repository
protocol LoginRepositoryProtocol: class {

    func performLogin(googleToken: String, googleRefreshToken: String) -> Completable

}

// MARK: - DataManager
protocol LoginLocalDataManagerProtocol: class {

}

protocol LoginRemoteDataManagerProtocol: class {

    func authenticate(googleAuth: GoogleAuthEncodable) -> Single<String>
    func getUserData() -> Single<UserDecodable>

}
