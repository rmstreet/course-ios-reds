//
//  PrimitiveSequenceType+IgnoreElements.swift
//  Thot
//
//  Created by Marcus Costa on 19/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

extension PrimitiveSequenceType {

    func ignoreElements() -> Completable {
        return primitiveSequence.asObservable()
            .ignoreElements()
    }

}
