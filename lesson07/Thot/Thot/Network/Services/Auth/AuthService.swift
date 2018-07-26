//
//  AuthService.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import CodableAlamofire

final class AuthService: AuthServiceProtocol {

    private enum API: String, ServiceApi {
        case googleAuth = "auth/social/google/signin"
        case me = "auth/me"
    }

    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func authenticate(googleAuth: GoogleAuthEncodable, scheduler: ImmediateSchedulerType?) -> Single<String> {
        let endpoint = Endpoint(method: .post, api: API.googleAuth, port: APIPort.base)

        return Single.create(subscribe: { observer -> Disposable in
            let request = self.requestManager.request(endpoint: endpoint, data: googleAuth)
                .responseString { responseData in
                    NetworkDebugManager.log(responseData)
                    if let token = responseData.response?.allHeaderFields["Authorization"] as? String,
                        token.isNotEmpty {
                        observer(.success(token))
                    } else {
                        let error = RequestManager.getError(response: responseData) ?? NetworkError.requestFailure
                        observer(.error(error))
                    }
            }

            return Disposables.create {
                request.cancel()
            }
        })
            .subscribeAndObserveOn(scheduler)
    }

    func getUserData(scheduler: ImmediateSchedulerType?) -> Single<UserDecodable> {
        let endpoint = Endpoint(api: API.me, port: APIPort.base)
        return requestManager.request(endpoint: endpoint)
            .asSingle(scheduler: scheduler)
    }


}
