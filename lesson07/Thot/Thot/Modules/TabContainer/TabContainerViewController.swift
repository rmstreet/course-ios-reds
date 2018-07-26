//
//  TabContainerViewController.swift
//  Thot
//
//  Created on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class TabContainerViewController: UIViewController {
    
    var presenter: TabContainerPresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        setupLabels()
        applyStyle()
    }
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        
    }
    
    private func setupLabels() {
        
    }
    
    private func applyStyle() {
        
    }
    
}

// MARK: - TabContainerViewProtocol
extension TabContainerViewController: TabContainerViewProtocol {
    
}
