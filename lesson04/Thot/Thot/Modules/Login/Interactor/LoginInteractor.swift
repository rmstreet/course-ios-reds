//
//  LoginInteractor.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

final class LoginInteractor: LoginInteractorProtocol {

    weak var output: LoginInteractorOutput!

    func performSignIn() {
        getToken()
    }

    private func getToken() {
        let parameters: Parameters = ["googleToken": "46ca459e-f1fb-4ec7-90a9-f08bc6f27d43",
                                      "googleRefreshToken": "f2abc149-2689"]

        Alamofire.request("http://192.168.8.207:9001/auth/social/google/signin", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseString { [weak self] responseData in
                if let token = responseData.response?.allHeaderFields["Authorization"] as? String,
                    token.isNotEmpty {
                    debugPrint("Sucesso, token: \(token)")
                    self?.getUserData(token: token)
                } else {
                    debugPrint("Falha na requisição: \(responseData.result.error)")
                    if let data = responseData.data,
                        let message = String(data: data, encoding: .utf8) {
                        debugPrint(message)
                    }
                    self?.output.onLoginFailure()
                }
        }
    }

    private func getUserData(token: String) {
        let headers = ["Authorization": token]

        Alamofire.request("http://192.168.8.207:9001/auth/me", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { [weak self] responseData in
                if responseData.result.isSuccess {
                    debugPrint(responseData.result.value)
                    self?.output.onLoginSuccess()
                } else {
                    debugPrint("Falha na requisição: \(responseData.result.error)")
                    if let data = responseData.data,
                        let message = String(data: data, encoding: .utf8) {
                        debugPrint(message)
                    }
                    self?.output.onLoginFailure()
                }
        }
    }

}
