//
//  OfflineRouterMock.swift
//  ThotTests
//
//  Created by Marcus Costa on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

@testable import Thot

final class OfflineRouterMock: OfflineRouterProtocol {

    var viewController: UIViewController!
    var isScreenClosed = false

    func dismiss() {
        isScreenClosed = true
    }

}
