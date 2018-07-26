//
//  CredentialsManager.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

protocol CredentialsManager: class {

    var jwtAccessToken: String? { get set }

}
