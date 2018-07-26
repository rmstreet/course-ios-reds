//
//  NetworkSetup.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

final class NetworkSetup {

    private init() {
        // Instantiate only on setup function
    }

    static func initialize() {
        let networkSetup = NetworkSetup()
        networkSetup.setupRequestManager()
    }

    private func setupRequestManager() {
        let apiController = APIController.default

        let config = RequestManagerConfig(apiController: apiController,
                                          errorParser: nil,
                                          logLevel: .all)

        RequestManager.config = config
    }

}
