//
//  LeadsService.swift
//  Thot
//
//  Created by Marcus Costa on 25/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

final class LeadsService: LeadsServiceProtocol {

    private enum API: String, ServiceApi {
        case leads = "leads"
        case followedLeads = "leads/following"
        case follow = "leads/{leadId}/follow"
    }

    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }

    func getLeads(scheduler: ImmediateSchedulerType?) -> Single<[LeadDecodable]> {
        let endpoint = Endpoint(api: API.leads, port: APIPort.base)
        return requestManager.request(endpoint: endpoint)
            .asSingle(scheduler: scheduler)
    }

    func getFollowedLeads(scheduler: ImmediateSchedulerType?) -> Single<[LeadDecodable]> {
        let endpoint = Endpoint(api: API.followedLeads, port: APIPort.base)
        return requestManager.request(endpoint: endpoint)
            .asSingle(scheduler: scheduler)
    }

    func getLead(leadId: String, scheduler: ImmediateSchedulerType?) -> Single<LeadDecodable> {
        let endpoint = Endpoint(api: API.leads, port: APIPort.base, resource: leadId)
        return requestManager.request(endpoint: endpoint)
            .asSingle(scheduler: scheduler)
    }

    func followLead(leadId: String, scheduler: ImmediateSchedulerType?) -> Completable {
        let endpoint = Endpoint(api: API.follow, port: APIPort.base, pathParameters: ["leadId": leadId])
        return requestManager.request(endpoint: endpoint)
            .asCompletable(scheduler: scheduler)
    }

}
