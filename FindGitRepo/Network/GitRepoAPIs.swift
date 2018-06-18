//
//  GitRepoAPIs.swift
//  FindGitRepo
//  APIs for GitHub Repo
//  Created by Shashank Mishra on 26/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class GitRepoAPIs: Endpoints {
    
    static let shared = GitRepoAPIs()
    
    func getRepoFor(language: String, completion: @escaping ([RepoDetails]?) -> Void) {
        
        //Added additional parameters to get popular & sorted repositories in descending order
        let endpoint = "\(getPublicRepos)?q=\(language)+language:\(language)+sort=stars&order=desc"
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/vnd.github.mercy-preview+json", forHTTPHeaderField: "Accept")
        
        // make the request
        HttpClient.shared.get(urlRequest) { (data, error) in
        
            // check for any errors
            guard error == nil else {
                completion(nil)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                completion(nil)
                return
            }
            // parse the result as JSON and find out "items" in response
            do {
                guard let responseJSON = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        completion(nil)
                        return
                }
                guard let itemsArray = responseJSON["items"] as? [[String: Any]], itemsArray.count > 0 else {
                    completion(nil)
                    return
                }
                var repoDetailsArray: [RepoDetails] = []
                for item in itemsArray {
                    guard let repoDetails = RepositoryData.getRepoDetails(item) else {
                        continue
                    }
                    repoDetailsArray.append(repoDetails)
                }
                completion(repoDetailsArray)
                
            } catch  {
                completion(nil)
                return
            }
        }
    }
    
    func getIssuesFor(repoName: String, completion: @escaping (RepoIssues?) -> Void) {
        
        //Added additional parameters to get latest issues in descending order
        let endpoint = "\(getRepoIssues)?q=repo:\(repoName)+sort=created&order=desc"
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/vnd.github.v3.text-match+json", forHTTPHeaderField: "Accept")
        
        // make the request
         HttpClient.shared.get(urlRequest) { (data, error) in
            
            // check for any errors
            guard error == nil else {
                completion(nil)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                completion(nil)
                return
            }
            // parse the result as JSON and find out issues "items" in response
            do {
                guard let responseJSON = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        completion(nil)
                        return
                }
                guard let itemsArray = responseJSON["items"] as? [[String: Any]], itemsArray.count > 0 else {
                    completion(nil)
                    return
                }
                guard let repoIssuesArray = RepositoryData.getRepoIssues(itemsArray) else {
                    completion(nil)
                    return
                }
                completion(repoIssuesArray)
                
            } catch  {
                completion(nil)
                return
            }
        }
    }
    
    func getContributorsFor(repoName: String, ownerName: String, completion: @escaping (RepoContributors?) -> Void) {
        
        //It provides list in sorted order based on contributions count by default.
        let endpoint = "\(getContributorsRepos)/\(ownerName)/\(repoName)/contributors"
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/vnd.github.v3.text-match+json", forHTTPHeaderField: "Accept")
        
        // make the request
         HttpClient.shared.get(urlRequest) { (data, error) in
            
            // check for any errors
            guard error == nil else {
                completion(nil)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                completion(nil)
                return
            }
            // parse the result as JSON and find out contributors array in response
            do {
                guard let itemsArray = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [[String: Any]], itemsArray.count > 0 else {
                        completion(nil)
                        return
                }
                guard let repoContriArray = RepositoryData.getRepoContributors(itemsArray) else {
                    completion(nil)
                    return
                }
                completion(repoContriArray)
                
            } catch  {
                completion(nil)
                return
            }
        }
    }
    
}

