//
//  UserDefaultsProtocol.swift
//  Thot
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

protocol UserDefaultsProtocol {

    func bool(forKey defaultName: String) -> Bool
    func set(_ value: Bool, forKey defaultName: String)
    @discardableResult func synchronize() -> Bool

}

extension UserDefaults: UserDefaultsProtocol {
    // Required by abstract class
}
