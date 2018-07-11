//
//  Fonts.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    enum Style: String {
        case regular = "Regular"
        case black = "Black"
        case light = "Light"
    }

    private static func robotoFontName(style: Style) -> String {
        return "Roboto-\(style.rawValue)"
    }

    static func roboto(style: Style, size: CGFloat) -> UIFont {
        let fontName = robotoFontName(style: style)
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
    }

}
