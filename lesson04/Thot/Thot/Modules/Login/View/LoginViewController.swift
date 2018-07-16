//
//  LoginViewController.swift
//  Thot
//
//  Created by Marcus Costa on 05/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit
import Alamofire

final class LoginViewController: UIViewController {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubTitle: UILabel!

    @IBOutlet private weak var buttonSignIn: UIButton!

    @IBOutlet private weak var viewContainerInfo: UIView!

    var presenter: LoginPresenterProtocol!

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        localizeBackButton()
        applyLanguage()
        applyStyle()
    }

    // MARK: - Setup
    private func applyLanguage() {
        title = String(identifier: .loginTitle)

        labelTitle.text = String(identifier: .loginTitleMessage)
        labelSubTitle.text = String(identifier: .loginSubTitleMessage)
    }

    private func applyStyle() {
        Style.apply(onPrimaryButton: buttonSignIn)
        Style.apply(onTitleLabels: [labelTitle])
        Style.apply(onSubTitleLabels: [labelSubTitle])

        Style.withBackgroundColor(UIColor.App.grayBackground)
            .apply(on: view)

        Style.withBackgroundColor(.white)
            .border(color: UIColor.Login.grayBorder, width: 1, radius: 6)
            .apply(on: viewContainerInfo)
    }

    // MARK: - Actions
    @IBAction private func buttonSignInTapped() {
        presenter.performSignIn()
    }

}

// MARK: - LoginViewProtocol
extension LoginViewController: LoginViewProtocol {

    func presentError(message: String) {
        let alertController = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
