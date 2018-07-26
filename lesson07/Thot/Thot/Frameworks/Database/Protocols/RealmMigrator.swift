//
//  RealmMigrator.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmMigrator {

    func execute(migration: Migration, realmInstance: RealmFactory.Instance, oldVersion: UInt64, currentVersion: UInt64)

}
