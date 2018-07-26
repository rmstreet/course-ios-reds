//
//  OfflineViewController.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OfflineViewController: UIViewController {
    
    @IBOutlet private weak var labelInfo: UILabel!

    @IBOutlet private weak var buttonClose: UIButton!
    @IBOutlet private weak var buttonTryAgain: UIButton!

    var presenter: OfflinePresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        setupLabels()
        applyStyle()
        presenter.viewDidLoad()
    }
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        labelInfo.accessibilityIdentifier = "labelInfo"

        buttonClose.accessibilityIdentifier = "buttonClose"
        buttonTryAgain.accessibilityIdentifier = "buttonTryAgain"
    }
    
    private func setupLabels() {
        labelInfo.text = String(identifier: .offlineMessage)

        buttonClose.setTitle(String(identifier: .offlineClose), for: .normal)
        buttonTryAgain.setTitle(String(identifier: .offlineTryAgain), for: .normal)
    }
    
    private func applyStyle() {
        Style.apply(onPrimaryButton: buttonClose)
        Style.apply(onPrimaryButton: buttonTryAgain)

        Style.apply(onTitleLabels: [labelInfo])
    }

    // MARK: - Actions
    @IBAction func buttonCloseTapped() {
        presenter.closeScreen()
    }

    @IBAction func buttonTryAgainTapped() {
        presenter.tryAgain()
    }

}

// MARK: - OfflineViewProtocol
extension OfflineViewController: OfflineViewProtocol {

    func disableTryAgainButton() {
        buttonTryAgain.isHidden = true
    }

    func disableCloseButton() {
        buttonClose.isHidden = true
    }

}
