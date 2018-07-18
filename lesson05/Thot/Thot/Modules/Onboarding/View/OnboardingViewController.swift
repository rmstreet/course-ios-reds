//
//  OnboardingViewController.swift
//  Thot
//
//  Created on 17/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private weak var labelInfo: UILabel!

    @IBOutlet private weak var buttonDone: UIButton!

    var presenter: OnboardingPresenterProtocol!
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
        applyLanguage()
        applyStyle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Setup Methods
    private func setupAccessibilityIdentifiers() {
        labelInfo.accessibilityIdentifier = "labelInfo"

        buttonDone.accessibilityIdentifier = "buttonDone"
    }
    
    private func applyLanguage() {
        labelInfo.text = String(identifier: .onboardingInfo)
    }
    
    private func applyStyle() {
        Style.apply(onPrimaryButton: buttonDone)
        Style.apply(onTitleLabels: [labelInfo])
    }

    // MARK: - Actions
    @IBAction private func buttonDoneTapped() {
        presenter.finishOnboarding()
    }
    
}

// MARK: - OnboardingViewProtocol
extension OnboardingViewController: OnboardingViewProtocol {
    // Required by Viper
}
