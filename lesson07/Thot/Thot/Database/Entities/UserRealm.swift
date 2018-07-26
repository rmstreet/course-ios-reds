//
//  UserRealm.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RealmSwift

final class UserRealm: Object {

    @objc dynamic var id = String()
    @objc dynamic var name = String()
    @objc dynamic var email = String()

    override static func primaryKey() -> String? {
        return "id"
    }

}

// MARK: - Factories
extension UserRealm {

    convenience init(userDecodable: UserDecodable) {
        self.init()
        id = userDecodable.id
        name = userDecodable.name
        email = userDecodable.email
    }

}
