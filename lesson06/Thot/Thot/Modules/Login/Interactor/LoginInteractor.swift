//
//  LoginInteractor.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

final class LoginInteractor: LoginInteractorProtocol {

    private let repository: LoginRepositoryProtocol

    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }

    var authenticateObservable: Completable {
        return repository.performLogin(googleToken: "46ca459e-f1fb-4ec7-90a9-f08bc6f27d43",
                                       googleRefreshToken: "f2abc149-2689")
    }

}
