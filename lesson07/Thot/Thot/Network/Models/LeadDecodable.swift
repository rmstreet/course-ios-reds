//
//  LeadDecodable.swift
//  Thot
//
//  Created by Marcus Costa on 25/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

struct LeadDecodable: Decodable {

    let id: String
    let pipedriveLeadId: String
    let userFollowingCount: Int
    let commentsCount: Int
    let name: String
    let companyName: String
    let creator: UserDecodable

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case pipedriveLeadId
        case userFollowingCount
        case commentsCount
        case name
        case companyName
        case creator = "creatorId"
    }

}
