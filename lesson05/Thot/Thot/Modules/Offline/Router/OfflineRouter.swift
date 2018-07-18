//
//  OfflineRouter.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OfflineRouter: OfflineRouterProtocol, Storyboarded {
    
    static let storyboardName = "Offline"
    
    weak var viewController: UIViewController!
    
    static func assembleModule(isTryAgainOnly: Bool = false, tryAgainBlock: (() -> Void)? = nil) -> UIViewController {
        let view: OfflineViewController = storyboard.instantiateViewController()
        let presenter = OfflinePresenter(isTryAgainOnly: isTryAgainOnly, tryAgainBlock: tryAgainBlock)
        let router = OfflineRouter()
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.router = router

        return view
    }

    func dismiss() {
        viewController.dismiss(animated: true, completion: nil)
    }

}
