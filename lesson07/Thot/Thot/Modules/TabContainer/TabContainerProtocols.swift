//
//  TabContainerProtocols.swift
//  Thot
//
//  Created on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Presenter
protocol TabContainerPresenterProtocol: class {
    
    var view: TabContainerViewProtocol! { get set }
    var router: TabContainerRouterProtocol! { get set }
    
}

// MARK: - View
protocol TabContainerViewProtocol: class {
    
    var presenter: TabContainerPresenterProtocol! { get set }
    
}

// MARK: - Router
protocol TabContainerRouterProtocol: class {
    
    var viewController: UIViewController! { get set }
    
}


