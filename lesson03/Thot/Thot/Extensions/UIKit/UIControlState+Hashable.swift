//
//  UIControlState+Hashable.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

extension UIControlState: Hashable {

    public var hashValue: Int {
        return Int(rawValue)
    }

}
