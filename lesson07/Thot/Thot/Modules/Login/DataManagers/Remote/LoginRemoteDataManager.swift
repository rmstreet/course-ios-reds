//
//  LoginRemoteDataManager.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

final class LoginRemoteDataManager: LoginRemoteDataManagerProtocol {

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
    }

    func authenticate(googleAuth: GoogleAuthEncodable, scheduler: ImmediateSchedulerType?) -> Single<String> {
        return authService.authenticate(googleAuth: googleAuth, scheduler: scheduler)
    }

    func getUserData(scheduler: ImmediateSchedulerType?) -> Single<UserDecodable> {
        return authService.getUserData(scheduler: scheduler)
    }
}
