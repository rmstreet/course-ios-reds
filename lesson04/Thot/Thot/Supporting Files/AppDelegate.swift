//
//  AppDelegate.swift
//  Thot
//
//  Created by Marcus Costa on 05/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        StyleBuilder.initialize()
        initialSetup()
        return true
    }

    private func initialSetup() {
        window = UIWindow(frame: UIScreen.main.bounds)

        let loginController = LoginRouter.assembleModule()
        let navigationController = UINavigationController(rootViewController: loginController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
