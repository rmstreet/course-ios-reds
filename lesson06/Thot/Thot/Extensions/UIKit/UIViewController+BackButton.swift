//
//  UIViewController+BackButton.swift
//  Thot
//
//  Created by Marcus Costa on 12/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func localizeBackButton(title: String? = nil) {
        let backItem = UIBarButtonItem()
        backItem.title = title ?? " "
        navigationItem.backBarButtonItem = backItem
    }

}
