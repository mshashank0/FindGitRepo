//
//  RepositoryDetailsViewController.swift
//  FindGitRepo
//  Showing Git repo details - name, description, 3 recent issues, top 3 contributors
//  Created by Shashank Mishra on 26/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescLabel: UILabel!
    @IBOutlet weak var repoContributerLabel: UILabel!
    @IBOutlet weak var repoIssuesLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var issuesActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var contriActivityIndicator: UIActivityIndicatorView!
        
    var repoDetails: RepoDetails!

    override func viewDidLoad() {
        
        repoNameLabel.text = repoDetails.shortName
        repoDescLabel.text = repoDetails.repoDescription
        
        //Get top repository issues
        issuesActivityIndicator.isHidden = false
        repoIssuesLabel.isHidden = true
        GitRepoAPIs.shared.getIssuesFor(repoName: repoDetails.name) { (repoIssuesArray) in
            var string = ""
            guard let issueArray = repoIssuesArray?.issuesArray else {
                DispatchQueue.main.async {
                    self.repoIssuesLabel.text = "No Issues Found"
                    self.issuesActivityIndicator.isHidden = true
                    self.repoIssuesLabel.isHidden = false
                }
                return
            }
            for (index, repoIssue) in issueArray.enumerated() {
                guard index < 3 else {
                   break
                }
                if index == 0 {
                  string = "\(index + 1). " + repoIssue
                }
                else {
                  string = string + "\n\n" + "\(index + 1). \(repoIssue)"
                }
            }
            UIView.animate(withDuration: 0.25, animations: {
                DispatchQueue.main.async {
                    self.repoIssuesLabel.text = string
                    self.issuesActivityIndicator.isHidden = true
                    self.repoIssuesLabel.isHidden = false
                }
            })
        }
        
        //Get top contributors
        self.contriActivityIndicator.isHidden = false
        self.repoContributerLabel.isHidden = true
        GitRepoAPIs.shared.getContributorsFor(repoName: repoDetails.shortName, ownerName: repoDetails.ownerLoginName) { (repoContriArray) in
            var string = ""
            guard let contriArray = repoContriArray?.contributorsArray else {
                DispatchQueue.main.async {
                    self.repoContributerLabel.text = "No Contributors Found"
                    self.contriActivityIndicator.isHidden = true
                    self.repoContributerLabel.isHidden = false
                }
                return
            }
            for (index, user) in contriArray.enumerated() {
                guard index < 3 else {
                    break
                }
                if index == 0 {
                    string = "\(index + 1). " + user
                }
                else {
                    string = string + "\n\n" + "\(index + 1). \(user)"
                }
            }
            UIView.animate(withDuration: 0.25, animations: {
                DispatchQueue.main.async {
                    self.repoContributerLabel.text = string
                    self.contriActivityIndicator.isHidden = true
                    self.repoContributerLabel.isHidden = false
                }
            })
        }
    }
    
    
}
