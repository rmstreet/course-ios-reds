//
//  DatabaseSetup.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

struct DatabaseSetup {

    static func initialize() {
        RealmFactory.realmMigrator = AppRealmMigrator()
    }

}
