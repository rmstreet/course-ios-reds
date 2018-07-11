//
//  TextStylable.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

protocol TextStylable {

    func applyTextFont(_ font: UIFont)
    func applyTextColor(_ color: UIColor, for state: UIControlState)
    func applyTextAlignment(_ alignment: NSTextAlignment)

}

extension UILabel: TextStylable {

    func applyTextFont(_ font: UIFont) {
        self.font = font
    }

    func applyTextColor(_ color: UIColor, for state: UIControlState) {
        textColor = color
    }

    func applyTextAlignment(_ alignment: NSTextAlignment) {
        textAlignment = alignment
    }

}

extension UIButton: TextStylable {

    func applyTextFont(_ font: UIFont) {
        titleLabel?.font = font
    }

    func applyTextColor(_ color: UIColor, for state: UIControlState) {
        setTitleColor(color, for: state)
    }

    func applyTextAlignment(_ alignment: NSTextAlignment) {
        titleLabel?.textAlignment = alignment
    }

}
