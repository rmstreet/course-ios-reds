//
//  Storyboarded.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {

    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }

}

extension Storyboarded {

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }

}
