//
//  ViewController.swift
//  Thot
//
//  Created by Marcus Costa on 05/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubTitle: UILabel!

    @IBOutlet private weak var buttonSignIn: UIButton!

    @IBOutlet private weak var viewContainerInfo: UIView!

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
    }

    // MARK: - Setup
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

    @IBAction func buttonSignInTapped() {
        debugPrint("Button tapped!!!")
        let controller = UIViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}
