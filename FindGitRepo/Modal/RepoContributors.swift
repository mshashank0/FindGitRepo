//
//  RepoContributors.swift
//  FindGitRepo
//
//  Created by Shashank Mishra on 27/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class RepoContributors: NSObject {
    
    var contributorsArray: [String]?
    init(_ contributorsArray: [String]) {
        self.contributorsArray = contributorsArray
    }
}
