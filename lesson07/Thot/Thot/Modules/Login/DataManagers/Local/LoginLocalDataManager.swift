//
//  LoginLocalDataManager.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RealmSwift

final class LoginLocalDataManager: LoginLocalDataManagerProtocol {

    func saveUser(userDecodable: UserDecodable) {
        let user = UserRealm(userDecodable: userDecodable)

        let realm = try! RealmFactory.make(for: .default)
        try! realm.write {
            realm.add(user, update: true)
        }
    }

}
