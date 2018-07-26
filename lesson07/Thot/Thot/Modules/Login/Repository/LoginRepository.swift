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
    private let scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated)

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

        return remoteDataManager.authenticate(googleAuth: googleAuth, scheduler: scheduler)
            .asObservable()
            .flatMap { [weak self] token -> Completable in
                return self?.saveJwtToken(token: token) ?? Completable.empty()
            }
            .asCompletable()
            .andThen(self.remoteDataManager.getUserData(scheduler: scheduler))
            .asObservable()
            .flatMap { [weak self] userDecodable -> Completable in
                return self?.saveUser(userDecodable: userDecodable) ?? Completable.empty()
            }
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

    private func saveUser(userDecodable: UserDecodable) -> Completable {
        return Completable.create(subscribe: { [weak self] observer -> Disposable in
            self?.localDataManager.saveUser(userDecodable: userDecodable)
            debugPrint("User saved: \(userDecodable)")
            observer(.completed)
            return Disposables.create()
        })
    }

}
