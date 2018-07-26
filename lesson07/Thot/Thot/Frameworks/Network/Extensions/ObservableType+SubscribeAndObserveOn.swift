//
//  ObservableType+SubscribeAndObserveOn.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {

    func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Observable<E> {
        guard let scheduler = scheduler else {
            return asObservable()
        }

        return subscribeOn(scheduler)
            .observeOn(scheduler)
    }

}

extension PrimitiveSequenceType where TraitType == SingleTrait {

    func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Single<ElementType> {
        return primitiveSequence
        .asObservable()
        .subscribeAndObserveOn(scheduler)
        .asSingle()
    }

}

extension PrimitiveSequenceType where TraitType == CompletableTrait {

    func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Completable {
        return primitiveSequence
            .asObservable()
            .subscribeAndObserveOn(scheduler)
            .ignoreElements()
    }

}
