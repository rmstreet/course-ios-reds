//
//  AuthServiceProtocol.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthServiceProtocol {

    func authenticate(googleAuth: GoogleAuthEncodable) -> Single<String>
    func getUserData() -> Single<UserDecodable>

}
