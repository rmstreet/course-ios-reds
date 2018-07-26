//
//  Encodable+Parameters.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

extension Encodable {

    var parameters: Parameters? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }

        let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonData.flatMap{ $0 as? Parameters }
    }

}
