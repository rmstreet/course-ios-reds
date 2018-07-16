//
//  Strings.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

extension String {

    enum Identifier: String {
        // MARK: - Login
        case loginTitle
        case loginTitleMessage
        case loginSubTitleMessage
    }

    init(identifier: Identifier, comment: String = String()) {
        self.init(stringLiteral: NSLocalizedString(identifier.rawValue, comment: comment))
    }

    init(identifier: Identifier, count: Int, comment: String = String()) {
        let format = NSLocalizedString(identifier.rawValue, comment: String())
        self.init(format: format, count)
    }

}
