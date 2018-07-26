//
//  LoginRepository.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

final class LoginRepository: LoginRepositoryProtocol {

    private let remoteDataManager: LoginRemoteDataManagerProtocol
    private let localDataManager: LoginLocalDataManagerProtocol
    private let credentialManager: CredentialsManager

    init(remoteDataManager: LoginRemoteDataManagerProtocol,
         localDataManager: LoginLocalDataManagerProtocol,
         credentialManager: CredentialsManager = UserCredentialsManager()) {
        self.remoteDataManager = remoteDataManager
        self.localDataManager = localDataManager
        self.credentialManager = credentialManager
    }

    func performLogin(googleToken: String, googleRefreshToken: String) -> Completable {
        let googleAuth = GoogleAuthEncodable(googleToken: googleToken,
                                             googleRefreshToken: googleRefreshToken)

        return remoteDataManager.authenticate(googleAuth: googleAuth)
            .asObservable()
            .flatMap { [weak self] token -> Completable in
                return self?.saveJwtToken(token: token) ?? Completable.empty()
            }
            .asCompletable()
            .andThen(self.remoteDataManager.getUserData())
            .do(onSuccess: { debugPrint("\($0)") })
            .ignoreElements()
    }

    private func saveJwtToken(token: String) -> Completable {
        return Completable.create(subscribe: { [weak self] observer -> Disposable in
            self?.credentialManager.jwtAccessToken = token
            debugPrint("JWT token saved!")
            observer(.completed)
            return Disposables.create()
        })
    }

}
