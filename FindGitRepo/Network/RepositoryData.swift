//
//  RepositoryData.swift
//  FindGitRepo
//  Objects for
//  Created by Shashank Mishra on 26/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//
import Foundation

struct RepositoryData {

    var name: String!
    
    static func getRepoDetails(_ item: [String: Any]) -> RepoDetails? {
        guard let id = item["id"] as? Int else {
            return nil
        }
        guard let url = item["git_url"] as? String else {
            return nil
        }
        guard let owner = item["owner"] as? [String: Any] else {
            return nil
        }
        guard let ownerName = owner["login"] as? String else {
            return nil
        }
        guard let ownerId = owner["id"] as? Int else {
            return nil
        }
        guard let name = item["full_name"] as? String else {
            return nil
        }
        guard let shortName = item["name"] as? String else {
            return nil
        }
        guard let repoDescription = item["description"] as? String else {
            return nil
        }
        let repoDetails = RepoDetails.init(id, ownerId: ownerId, ownerLoginName: ownerName, url: url, name: name, shortName: shortName, repoDescription: repoDescription)
        return repoDetails
    }
    
    static func getRepoIssues(_ items: [[String: Any]]) -> RepoIssues? {
        var repoIssuesArray: [String] = []
        for item in items {
            guard let title = item["title"] as? String else {
                continue
            }
            guard let url = item["url"] as? String else {
                continue
            }
            repoIssuesArray.append("Title: \(title) \nURL: \(url)")
        }
        let repoIssues = RepoIssues.init(repoIssuesArray)
        return repoIssues
    }
    
    static func getRepoContributors(_ items: [[String: Any]]) -> RepoContributors? {
        var repoContriArray: [String] = []
        for item in items {
            guard let name = item["login"] as? String else {
                continue
            }
            guard let url = item["url"] as? String else {
                continue
            }
            guard let contributions = item["contributions"] as? Int else {
                continue
            }
            repoContriArray.append("\(name) (URL: \(url)) \nContributions: \(contributions)")
        }
        let repoContributors = RepoContributors.init(repoContriArray)
        return repoContributors
    }
    
}

