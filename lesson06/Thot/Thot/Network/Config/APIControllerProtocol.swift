//
//  APIControllerProtocol.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

protocol APIControllerProtocol {

    var manager: Alamofire.SessionManager { get }
    var baseURL: String { get }

}
