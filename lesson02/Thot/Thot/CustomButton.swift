//
//  CustomButton.swift
//  Thot
//
//  Created by user139984 on 7/5/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}
