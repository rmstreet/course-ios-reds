//
//  TabContainerRouter.swift
//  Thot
//
//  Created on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class TabContainerRouter: TabContainerRouterProtocol, Storyboarded {
    
    static let storyboardName = "TabContainer"
    
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController {
        let view: TabContainerViewController = storyboard.instantiateViewController()
        let presenter = TabContainerPresenter()
        let router = TabContainerRouter()
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.router = router

        return view
    }

}
