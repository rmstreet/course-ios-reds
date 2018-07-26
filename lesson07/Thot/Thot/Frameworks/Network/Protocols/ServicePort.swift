//
//  ServicePort.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

protocol ServicePort {

    var value: String { get }
    var placeHolder: String { get }

}

extension ServicePort {

    var placeHolder: String {
        return "port"
    }

}

extension ServicePort where Self: RawRepresentable, Self.RawValue == Int {

    var value: String {
        return "\(rawValue)"
    }

}

