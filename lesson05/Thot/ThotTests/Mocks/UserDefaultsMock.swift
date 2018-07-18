//
//  UserDefaultsMock.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

@testable import Thot

final class UserDefaultsMock: UserDefaultsProtocol {

    var booleanValue = false
    var keyValue = String()
    var isSynchronized = false

    func bool(forKey defaultName: String) -> Bool {
        return booleanValue
    }

    func set(_ value: Bool, forKey defaultName: String) {
        keyValue = defaultName
        booleanValue = value
    }

    func synchronize() -> Bool {
        isSynchronized = true
        return isSynchronized
    }

}
