//
//  Colors.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: - App Default
    enum App {

        static var redPrimary: UIColor {
            return UIColor(hexString: "#ED5145")
        }

        static var grayBackground: UIColor {
            return UIColor(hexString: "#ECECEC")
        }

        static var blackTitle: UIColor {
            return UIColor(hexString: "#160F0F")
        }

        static var blackSubTitle: UIColor {
            return UIColor(hexString: "#504747")
        }

    }

    // MARK: Login
    enum Login {

        static var grayBorder: UIColor {
            return UIColor(hexString: "#BFBFBF")
        }

    }

}
