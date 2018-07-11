//
//  Styles.swift
//  Thot
//
//  Created by Marcus Costa on 10/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

extension StyleBuilder {

    func apply(onPrimaryButton stylable: Stylable) {
        Style.withBackgroundColor(UIColor.App.redPrimary)
            .withTextColor(.white, for: .normal)
            .withCornerRadius(stylable.frame.height / 2)
            .withFont(.roboto(style: .regular, size: 20))
            .apply(on: stylable)
    }

    func apply(onTitleLabels stylables: [TextStylable]) {
        Style.withTextColor(UIColor.App.blackTitle)
            .withFont(UIFont.roboto(style: .regular, size: 20))
            .withtextAlignment(.center)
            .apply(on: stylables)


    }

    func apply(onSubTitleLabels stylables: [TextStylable]) {
        Style.withTextColor(UIColor.App.blackSubTitle)
            .withFont(UIFont.roboto(style: .regular, size: 14))
            .withtextAlignment(.center)
            .apply(on: stylables)
    }

}