//
//  RepositoryListViewController.swift
//  FindGitRepo
//  Showing list of repository based on api response
//  Created by Shashank Mishra on 26/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {
    
    @IBOutlet weak var repoListTableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var noDataView: UIView!
    
    var repoArray: [RepoDetails]! = []
    var language: String! = "Java" //default
    
    override func viewDidLoad() {
        
        self.navigationItem.title = language.capitalized
        activityIndicator.isHidden = false
        
        //Fetching public repository list
        GitRepoAPIs.shared.getRepoFor(language: language) { (reponseArray) in
            guard reponseArray != nil else {
                self.noDataView.isHidden = false
                self.repoListTableView.isHidden = true
                self.noDataLabel.text = """
                Sorry, we are unable to get any repo list for "\(self.language!)" programming language,
                Dev Timeout might be the reason. Try to use with different IP address.
                """
                self.activityIndicator.isHidden = true
                return
            }
            self.repoArray = reponseArray
            DispatchQueue.main.async {
                self.noDataView.isHidden = true
                self.activityIndicator.isHidden = true
                self.repoListTableView.reloadData()
            }
        }
    }
    
    func gotoDetailsView(_ details: RepoDetails) {
        self.performSegue(withIdentifier: "RepoDetailsSegue", sender: ["details": details])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RepoDetailsSegue", let object = sender as? [String: RepoDetails], let details = object["details"] {
            let repoDetailsVC = segue.destination as! RepositoryDetailsViewController
            repoDetailsVC.repoDetails = details
        }
        
    }
}

extension RepositoryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GitCell.identifier) as? GitCell else {
            return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: GitCell.identifier)
        }
        guard indexPath.row < repoArray.count else {
           return cell
        }
        cell.setGitURL(repoArray[indexPath.row])
        return cell
        
    }
    
}

extension RepositoryListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < repoArray.count else {
            return
        }
        gotoDetailsView(repoArray[indexPath.row])
    }
    
}


