//
//  ServiceApi.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

protocol ServiceApi {

    var api: String { get }

}

extension ServiceApi where Self: RawRepresentable, Self.RawValue == String {

    var api: String {
        return rawValue
    }

}
