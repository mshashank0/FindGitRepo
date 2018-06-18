//
//  Endpoints.swift
//  FindGitRepo
//
//  Created by Shashank Mishra on 28/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class Endpoints {
    
    //Base URL
    let apiBaseURI = "https://api.github.com/"
    
    //Get Public repositories
    var getPublicRepos: String {
        get {
            return apiBaseURI + "search/repositories"
        }
    }
    
    //Search repository Issues
    var getRepoIssues: String {
        get {
            return apiBaseURI + "search/issues"
        }
    }
    
    //Get Contributors
    var getContributorsRepos: String {
        get {
            return apiBaseURI + "repos"
        }
    }
}
