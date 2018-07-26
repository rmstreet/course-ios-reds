//
//  LeadsServiceProtocol.swift
//  Thot
//
//  Created by Marcus Costa on 25/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

protocol LeadsServiceProtocol {

    func getLeads(scheduler: ImmediateSchedulerType?) -> Single<[LeadDecodable]>
    func getFollowedLeads(scheduler: ImmediateSchedulerType?) -> Single<[LeadDecodable]>
    func getLead(leadId: String, scheduler: ImmediateSchedulerType?) -> Single<LeadDecodable>
    func followLead(leadId: String, scheduler: ImmediateSchedulerType?) -> Completable

}
