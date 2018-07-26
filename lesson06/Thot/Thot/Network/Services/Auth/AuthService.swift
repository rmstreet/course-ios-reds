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

    private let apiController: APIControllerProtocol

    init(apiController: APIControllerProtocol = APIController.default) {
        self.apiController = apiController
    }

    func authenticate(googleAuth: GoogleAuthEncodable) -> Single<String> {
        return Single.create(subscribe: { observer -> Disposable in
            let request = self.apiController.manager.request("\(self.apiController.baseURL)/auth/social/google/signin", method: .post, parameters: googleAuth.parameters, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .responseString { responseData in
                    if let token = responseData.response?.allHeaderFields["Authorization"] as? String,
                        token.isNotEmpty {
                        debugPrint("Sucesso, token: \(token)")
                        observer(.success(token))
                    } else {
                        debugPrint("Falha na requisição: \(responseData.result.error!)")
                        if let data = responseData.data,
                            let message = String(data: data, encoding: .utf8) {
                            debugPrint(message)
                        }
                        //                    self?.output.onLoginFailure(error: responseData.result.error!)
                        observer(.error(responseData.result.error!))
                    }
            }

            return Disposables.create {
                request.cancel()
            }
        })
    }

    func getUserData() -> Single<UserDecodable> {
        return Single.create(subscribe: { observer -> Disposable in
            let request = self.apiController.manager.request("\(self.apiController.baseURL)/auth/me", method: .get)
                .validate(statusCode: 200..<300)
                .responseDecodableObject(completionHandler: { (response: DataResponse<UserDecodable>) in
                    if response.result.isSuccess {
                        if let object = response.result.value {
                            observer(.success(object))
                        } else {
                            observer(.error(NetworkError.objectParser))
                        }
                    } else {
                        let error = response.result.error ?? NetworkError.requestFailure
                        observer(.error(error))
                    }
                })

            return Disposables.create {
                request.cancel()
            }
        })
    }


}
