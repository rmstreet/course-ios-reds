//
//  OfflineProtocols.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Presenter
protocol OfflinePresenterProtocol: class {
    
    var view: OfflineViewProtocol! { get set }
    var router: OfflineRouterProtocol! { get set }

    func viewDidLoad()
    func closeScreen()
    func tryAgain()

}

// MARK: - View
protocol OfflineViewProtocol: class {
    
    var presenter: OfflinePresenterProtocol! { get set }

    func disableTryAgainButton()
    func disableCloseButton()
    
}

// MARK: - Router
protocol OfflineRouterProtocol: class {
    
    var viewController: UIViewController! { get set }

    func dismiss()

}


