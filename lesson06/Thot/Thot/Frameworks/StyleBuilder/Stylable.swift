//
//  Stylable.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

protocol Stylable {

    var frame: CGRect { get }

    func applyBackgroundColor(_ color: UIColor)
    func applyCornerRadius(_ radius: CGFloat)
    func applyBorderColor(_ color: UIColor)
    func applyBorderWidth(_ width: CGFloat)

}

extension UIView: Stylable {

    func applyBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }

    func applyCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

    func applyBorderColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
    }

    func applyBorderWidth(_ width: CGFloat) {
        layer.borderWidth = width
    }

}
