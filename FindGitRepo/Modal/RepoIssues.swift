//
//  RepoIssues.swift
//  FindGitRepo
//
//  Created by Shashank Mishra on 27/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class RepoIssues: NSObject {
    
    var issuesArray: [String]?
    init(_ issuesArray: [String]) {
        self.issuesArray = issuesArray
    }
}
