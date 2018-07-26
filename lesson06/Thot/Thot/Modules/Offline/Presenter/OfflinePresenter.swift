//
//  OfflinePresenter.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OfflinePresenter: OfflinePresenterProtocol {

    weak var view: OfflineViewProtocol!
    var router: OfflineRouterProtocol!

    private let isTryAgainOnly: Bool
    private let tryAgainBlock: (() -> Void)?

    init(isTryAgainOnly: Bool, tryAgainBlock: (() -> Void)?) {
        self.isTryAgainOnly = isTryAgainOnly
        self.tryAgainBlock = tryAgainBlock
    }

    func viewDidLoad() {
        if isTryAgainOnly {
            view.disableCloseButton()
        }

        if tryAgainBlock == nil {
            view.disableTryAgainButton()
        }
    }

    func closeScreen() {
        router.dismiss()
    }

    func tryAgain() {
        router.dismiss()
        tryAgainBlock?()
    }
    
}
