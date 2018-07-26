//
//  ServiceVersion.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

protocol ServiceVersion {

    var value: String { get }
    var placeHolder: String { get }

}

extension ServiceVersion {

    var placeHolder: String {
        return "version"
    }

}

extension ServiceVersion where Self: RawRepresentable, Self.RawValue == String {

    var value: String {
        return rawValue
    }

}
