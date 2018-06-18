//
//  GitCell.swift
//  FindGitRepo
//
//  Created by Shashank Mishra on 26/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import UIKit
import Foundation

class GitCell: UITableViewCell {
    
    static let identifier = "GitCell"
    
    @IBOutlet weak var gitURLLabel: UILabel!
    
    func setGitURL(_ value: RepoDetails) {
        gitURLLabel.text = value.url
    }
    
}

