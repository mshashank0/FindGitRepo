//
//  RepoDetails.swift
//  FindGitRepo
//
//  Created by Shashank Mishra on 27/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class RepoDetails: NSObject {
    var id: Int!
    var ownerId: Int!
    var name: String!
    var shortName: String!
    var ownerLoginName: String!
    var url: String!
    var repoDescription: String!
    
    init(_ id: Int, ownerId: Int, ownerLoginName: String, url: String, name: String, shortName: String, repoDescription: String) {
        self.id = id
        self.ownerId = ownerId
        self.ownerLoginName = ownerLoginName
        self.name = name
        self.shortName = shortName
        self.url = url
        self.repoDescription = repoDescription
    }
}
