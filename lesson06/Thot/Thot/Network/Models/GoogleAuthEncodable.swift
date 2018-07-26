//
//  GoogleAuthEncodable.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

struct GoogleAuthEncodable: Encodable {

    let googleToken: String
    let googleRefreshToken: String

}
