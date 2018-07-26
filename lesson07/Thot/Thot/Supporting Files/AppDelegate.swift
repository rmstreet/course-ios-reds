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

    private var defaultsManager: DefaultsManager = UserDefaultsManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        StyleBuilder.initialize()
        NetworkSetup.initialize()
        DatabaseSetup.initialize()
        initialSetup()
        return true
    }

    private func initialSetup() {
        window = UIWindow(frame: UIScreen.main.bounds)

        let controller = defaultsManager.isOnboardingDidShow ? LoginRouter.assembleModule() : OnboardingRouter.assembleModule()
        let navigationController = UINavigationController(rootViewController: controller)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
